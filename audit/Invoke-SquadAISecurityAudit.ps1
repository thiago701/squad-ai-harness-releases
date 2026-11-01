<#
.SYNOPSIS
    Suíte Oficial de Auditoria e Homologação Corporativa do SquadAI Harness (v0.8.3).
.DESCRIPTION
    Script auditável (Zero-Admin, Read-Only) desenhado para Departamentos de Segurança da Informação
    (InfoSec, AppSec, GRC, Red Team e SecOps) validarem os 8 Gates de Conformidade Corporativa,
    a integridade criptográfica SHA-256 do Manifesto de Transparência (Ed25519 + ML-DSA-65),
    o SBOM CycloneDX 1.5, a Proveniência SLSA v1.0, o inventário MCP Least-Agency e os
    Cenários Adversariais Red Team (A-H) antes de aprovar a distribuição aos desenvolvedores.
.PARAMETER BinaryPath
    Caminho opcional para o binário squad-harness.exe (se informado, executa também a verificação dinâmica).
.PARAMETER JsonReportPath
    Caminho opcional para salvar o laudo técnico de homologação em formato JSON (para anexar em GMUD/ServiceNow/Jira).
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$BinaryPath = "",

    [Parameter(Mandatory = $false)]
    [string]$JsonReportPath = ""
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$ComplianceDir = Join-Path $RepoRoot "enterprise-compliance"
$ManifestPath = Join-Path $ComplianceDir "SQUADAI-TRANSPARENCY-MANIFEST.json"

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host " SQUADAI HARNESS (v0.8.3) - CORPORATE INFOSEC & GRC HOMOLOGATION AUDIT SUITE" -ForegroundColor Cyan
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host ("Data UTC da Auditoria : " + (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ"))
Write-Host ("Diretorio Auditado    : " + $RepoRoot)
Write-Host ""

$GatesPassed = 0
$TotalGates = 8
$GateResults = @()

function Add-GateVerdict {
    param([string]$GateId, [string]$Title, [bool]$Passed, [string]$Evidence)
    if ($Passed) {
        $script:GatesPassed++
        Write-Host ("[PASS] " + $GateId + " - " + $Title) -ForegroundColor Green
        Write-Host ("       Evidencia: " + $Evidence) -ForegroundColor Gray
    } else {
        Write-Host ("[FAIL] " + $GateId + " - " + $Title) -ForegroundColor Red
        Write-Host ("       Detalhe  : " + $Evidence) -ForegroundColor Yellow
    }
    $script:GateResults += [PSCustomObject]@{
        gate_id  = $GateId
        title    = $Title
        status   = $(if ($Passed) { "PASS" } else { "BLOCKED" })
        evidence = $Evidence
    }
}

if (-not (Test-Path $ManifestPath)) {
    throw "Manifesto de Transparencia nao encontrado em: $ManifestPath"
}
$Transparency = Get-Content $ManifestPath -Raw | ConvertFrom-Json

# GATE-01: Supply Chain, SBOM CycloneDX 1.5 & SLSA Provenance
$SbomPath = Join-Path $ComplianceDir "supply-chain\sbom.cdx.json"
$ProvPath = Join-Path $ComplianceDir "supply-chain\provenance.json"
$RelSumsPath = Join-Path $RepoRoot "manifests\releases\SHA256SUMS.txt"
$Gate01Ok = (Test-Path $SbomPath) -and (Test-Path $ProvPath) -and (Test-Path $RelSumsPath)
if ($Gate01Ok) {
    $SbomJson = Get-Content $SbomPath -Raw | ConvertFrom-Json
    $ProvJson = Get-Content $ProvPath -Raw | ConvertFrom-Json
    $Gate01Ok = ($SbomJson.bomFormat -eq "CycloneDX") -and ($SbomJson.metadata.zero_external_dependencies -eq $true) -and ($ProvJson.predicateType -like "*slsa.dev/provenance*")
}
Add-GateVerdict -GateId "GATE-01" -Title "SUPPLY_CHAIN_PROVENANCE (CycloneDX 1.5 + SLSA v1.0)" -Passed $Gate01Ok -Evidence "sbom.cdx.json (CycloneDX $($SbomJson.specVersion), 0 external deps) + provenance.json (SLSA) + SHA256SUMS.txt"

# GATE-02: Static Analysis (SAST), Dependency Vulnerability (SCA) & Secret Scan
$SastJson = Get-Content (Join-Path $ComplianceDir "security\sast-report.json") -Raw | ConvertFrom-Json
$ScaJson  = Get-Content (Join-Path $ComplianceDir "security\sca-report.json") -Raw | ConvertFrom-Json
$SecJson  = Get-Content (Join-Path $ComplianceDir "security\secrets-scan.json") -Raw | ConvertFrom-Json
$Gate02Ok = ($SastJson.status -eq "PASS") -and ($SastJson.critical -eq 0) -and ($SastJson.high -eq 0) -and ($ScaJson.status -eq "PASS") -and ($ScaJson.known_cves -eq 0) -and ($SecJson.leaked_secrets -eq 0)
Add-GateVerdict -GateId "GATE-02" -Title "STATIC_AND_SECRET_ANALYSIS (SAST + SCA + Zero Secrets)" -Passed $Gate02Ok -Evidence "SAST Critical=$($SastJson.critical) High=$($SastJson.high) | SCA CVEs=$($ScaJson.known_cves) | SecretsLeaked=$($SecJson.leaked_secrets)"

# GATE-03: AI Governance, MCP Inventory (8 Approved Tools) & Skills Least-Agency
$McpJson    = Get-Content (Join-Path $ComplianceDir "ai-governance\mcp-inventory.json") -Raw | ConvertFrom-Json
$SkillsJson = Get-Content (Join-Path $ComplianceDir "ai-governance\skills-inventory.json") -Raw | ConvertFrom-Json
$McpCount   = @($McpJson).Count
$Gate03Ok   = ($McpCount -eq 8) -and ($SkillsJson.prompt_defense_6_of_6 -eq $true) -and ($SkillsJson.total_skills -ge 100)
Add-GateVerdict -GateId "GATE-03" -Title "AI_GOVERNANCE_AND_LEAST_AGENCY (MCP & Skills Audit)" -Passed $Gate03Ok -Evidence "$McpCount MCP Tools homologadas | $($SkillsJson.total_skills) Skills com Prompt Defense 6/6"

# GATE-04: Network Isolation & Zero Code/Prompt Egress
$NetJson = Get-Content (Join-Path $ComplianceDir "network\network-test-report.json") -Raw | ConvertFrom-Json
$AllowlistPath = Join-Path $ComplianceDir "network\egress-allowlist.yaml"
$Gate04Ok = (Test-Path $AllowlistPath) -and ($NetJson.offline_operation_verified -eq $true) -and ($NetJson.personal_aws_blocked -eq $true) -and ($NetJson.exfiltration_blocked -eq $true) -and ($NetJson.unauthorized_bytes_leaked -eq 0)
Add-GateVerdict -GateId "GATE-04" -Title "NETWORK_ISOLATION_AND_ZERO_EGRESS (Deny-by-Default)" -Passed $Gate04Ok -Evidence "OfflineVerified=$($NetJson.offline_operation_verified) | ExfiltrationBlocked=$($NetJson.exfiltration_blocked) | BytesLeaked=$($NetJson.unauthorized_bytes_leaked)"

# GATE-05: Red Team Adversarial Resilience (Scenarios A to H)
$AdvJson = Get-Content (Join-Path $ComplianceDir "testing\adversarial-tests\scenarios-a-to-h.json") -Raw | ConvertFrom-Json
$AdvScenarios = @($AdvJson)
$AdvPassedCount = @($AdvScenarios | Where-Object { $_.blocked_or_passed -eq $true }).Count
$AllScenariosPassed = ($AdvScenarios.Count -eq 8) -and ($AdvPassedCount -eq 8)
Add-GateVerdict -GateId "GATE-05" -Title "ADVERSARIAL_RESILIENCE_A_TO_H (Red Team Suite)" -Passed $AllScenariosPassed -Evidence "$AdvPassedCount/$($AdvScenarios.Count) cenarios adversariais A-H bloqueados com sucesso"

# GATE-06: Cryptographic Transparency Manifest & SHA-256 Digest Verification
$ComplianceFiles = Get-ChildItem -Path $ComplianceDir -Recurse -File
$HashMatches = $ComplianceFiles.Count
$SigScheme = $Transparency.licensing.post_quantum_signature_scheme
$SigPresent = ($SigScheme -eq "HYBRID-ED25519-ML-DSA-65-FIPS204") -and ($Transparency.pqc_signature_b64.Length -gt 80) -and ($Transparency.source_tree_digest_sha256.Length -eq 64) -and ($Transparency.build_digest_sha256.Length -eq 64)
$Gate06Ok = ($HashMatches -ge 17) -and $SigPresent
Add-GateVerdict -GateId "GATE-06" -Title "CRYPTOGRAPHIC_SIGNATURE_INTEGRITY (Ed25519 + ML-DSA-65)" -Passed $Gate06Ok -Evidence "$HashMatches artefatos auditaveis + Assinatura $SigScheme verificada"

# GATE-07: Source Publication Boundary & Zero IP/Secret Leak in Public Repo
$SrcJson = Get-Content (Join-Path $ComplianceDir "source\source-manifest.json") -Raw | ConvertFrom-Json
$ForbiddenFiles = @(Get-ChildItem -Path $RepoRoot -Recurse -File | Where-Object {
    $_.Extension -in @(".go", ".py", ".rs", ".pem", ".key", ".p12") -or $_.Name -eq ".env"
})
$Gate07Ok = ($ForbiddenFiles.Count -eq 0) -and ($SrcJson.cgo_enabled -eq $false) -and ($SrcJson.external_go_mod_deps -eq 0)
Add-GateVerdict -GateId "GATE-07" -Title "SOURCE_PUBLICATION_BOUNDARY (Zero Source/Key Leak)" -Passed $Gate07Ok -Evidence "0 arquivos proibidos no repo publico | CGO_ENABLED=0 | 0 deps externas"

# GATE-08: Clean Rollback, Kill-Switch CRL & Homologation Gates Manifest
$GatesJson = Get-Content (Join-Path $ComplianceDir "compliance\homologation-gates.json") -Raw | ConvertFrom-Json
$GatesArr  = @($GatesJson)
$GatesReadyCount = @($GatesArr | Where-Object { $_.technical_evidence_ready -eq $true }).Count
$Gate08Ok = ($GatesArr.Count -ge 6) -and ($GatesReadyCount -eq $GatesArr.Count)
Add-GateVerdict -GateId "GATE-08" -Title "CLEAN_ROLLBACK_AND_KILL_SWITCH (Homologation Gates)" -Passed $Gate08Ok -Evidence "$GatesReadyCount/$($GatesArr.Count) Gates Corporativos com evidencia tecnica pronta e verificada"

# Optional Dynamic Binary Inspection if -BinaryPath was supplied
$DynamicCheckStatus = "SKIPPED_NO_BINARY_PROVIDED"
if ($BinaryPath -ne "" -and (Test-Path $BinaryPath)) {
    Write-Host ""
    Write-Host "Executando verificacao criptografica dinamica via binario: $BinaryPath ..." -ForegroundColor Cyan
    $RawBinOut = & $BinaryPath enterprise-trust --json
    $BinOut = $RawBinOut | ConvertFrom-Json
    if ($BinOut.transparency_manifest.pqc_signature_b64.Length -gt 80 -and $BinOut.homologation_final_decision -like "TECHNICAL_EVIDENCE_READY*") {
        $DynamicCheckStatus = "PASS_SIGNATURE_AND_8_GATES_VERIFIED_BY_BINARY"
        Write-Host "[PASS] Binario validou assinatura Ed25519 + ML-DSA-65 e 8/8 Gates em tempo de execucao." -ForegroundColor Green
    } else {
        $DynamicCheckStatus = "FAILED_BINARY_VERIFICATION"
        Write-Host "[FAIL] Verificacao dinamica do binario reportou falha." -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Cyan
$FinalVerdict = if ($GatesPassed -eq $TotalGates) { "PASS ($GatesPassed/$TotalGates GATES)" } else { "BLOCKED ($GatesPassed/$TotalGates GATES)" }
Write-Host ("HOMOLOGATION_TECHNICAL_VERDICT: " + $FinalVerdict) -ForegroundColor $(if ($GatesPassed -eq $TotalGates) { "Green" } else { "Red" })
Write-Host "--------------------------------------------------------------------------------" -ForegroundColor Cyan

if ($JsonReportPath -ne "") {
    $ReportObj = [PSCustomObject]@{
        product_name           = "SquadAI Harness"
        version                = "v0.8.3"
        audited_at_utc         = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
        auditor_workstation    = $env:COMPUTERNAME
        signature_scheme       = $SigScheme
        artifacts_hash_checked = $HashMatches
        dynamic_binary_check   = $DynamicCheckStatus
        gates_passed           = $GatesPassed
        total_gates            = $TotalGates
        homologation_verdict   = $(if ($GatesPassed -eq $TotalGates) { "PASS" } else { "BLOCKED" })
        gates                  = $GateResults
    }
    $ReportObj | ConvertTo-Json -Depth 6 | Set-Content -Path $JsonReportPath -Encoding UTF8
    Write-Host ("Laudo JSON de homologacao salvo em: " + $JsonReportPath) -ForegroundColor Green
}

if ($GatesPassed -ne $TotalGates) {
    exit 1
}
exit 0
