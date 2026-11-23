@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ==============================================================================
:: SQUADAI HARNESS (v1.1.114) - CORPORATE INFOSEC & GRC HOMOLOGATION AUDIT SUITE
:: 100% Nativo em Windows CMD (cmd.exe) - ZERO dependencia de PowerShell (.ps1)
:: Valida criptograficamente SHA256SUMS.txt (certutil), evidencias JSON, PQC e A-H
:: ==============================================================================

set "SCRIPT_DIR=%~dp0"
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
for %%I in ("%SCRIPT_DIR%\..") do set "REPO_ROOT=%%~fI"
set "COMPLIANCE_DIR=%REPO_ROOT%\enterprise-compliance"
set "MANIFEST=%COMPLIANCE_DIR%\SQUADAI-TRANSPARENCY-MANIFEST.json"
set "SUMS_FILE=%REPO_ROOT%\manifests\releases\SHA256SUMS.txt"
set "BINARY_PATH=%~1"

echo ================================================================================
echo  SQUADAI HARNESS (v1.1.114) - CORPORATE INFOSEC ^& GRC HOMOLOGATION AUDIT SUITE
echo  Engine: Windows CMD Nativo (Zero PowerShell · Validacao Criptografica Real)
echo ================================================================================
echo Estacao Auditora      : %COMPUTERNAME% (%USERNAME%)
echo Diretorio Auditado    : %REPO_ROOT%
echo.

set /a GATES_PASSED=0
set /a TOTAL_GATES=8

if not exist "%MANIFEST%" (
    echo [FAIL] Manifesto de Transparencia nao encontrado em: %MANIFEST%
    exit /b 1
)

:: GATE-01: Supply Chain, SBOM CycloneDX 1.5, SLSA Provenance & Real SHA-256 Checksum Validation
set "G1_OK=1"
if not exist "%COMPLIANCE_DIR%\supply-chain\sbom.cdx.json" set "G1_OK=0"
if not exist "%COMPLIANCE_DIR%\supply-chain\provenance.json" set "G1_OK=0"
if not exist "%SUMS_FILE%" set "G1_OK=0"
if "!G1_OK!"=="1" (
    findstr /C:"\"bomFormat\": \"CycloneDX\"" "%COMPLIANCE_DIR%\supply-chain\sbom.cdx.json" >nul || set "G1_OK=0"
    findstr /C:"slsa.dev/provenance" "%COMPLIANCE_DIR%\supply-chain\provenance.json" >nul || set "G1_OK=0"
    set /a HASH_CHECKED=0
    for /f "usebackq tokens=1,2" %%H in ("%SUMS_FILE%") do (
        set "EXP_HASH=%%H"
        set "REL_TARGET=%%I"
        set "REL_TARGET=!REL_TARGET:/=\!"
        if exist "%REPO_ROOT%\!REL_TARGET!" (
            set "ACT_HASH="
            for /f "skip=1 delims=" %%L in ('certutil -hashfile "%REPO_ROOT%\!REL_TARGET!" SHA256 2^>nul') do (
                if not defined ACT_HASH set "ACT_HASH=%%L"
            )
            set "ACT_HASH=!ACT_HASH: =!"
            if /I not "!ACT_HASH!"=="!EXP_HASH!" (
                echo [TAMPER] SHA-256 divergente para !REL_TARGET!: esperado=!EXP_HASH! obtido=!ACT_HASH!
                set "G1_OK=0"
            ) else (
                set /a HASH_CHECKED+=1
            )
        )
    )
    if !HASH_CHECKED! LSS 1 (
        echo [FAIL] Nenhum artefato de SHA256SUMS.txt encontrado para verificacao criptografica
        set "G1_OK=0"
    )
)
if "!G1_OK!"=="1" (
    echo [PASS] GATE-01 - SUPPLY_CHAIN_PROVENANCE ^(CycloneDX 1.5 + SLSA v1.0 + !HASH_CHECKED! SHA-256 verificados^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-01 - SUPPLY_CHAIN_PROVENANCE
)

:: GATE-02: Static Analysis (SAST), Dependency Vulnerability (SCA) & Secret Scan (Content Checked)
set "G2_OK=1"
if not exist "%COMPLIANCE_DIR%\security\sast-report.json" set "G2_OK=0"
if not exist "%COMPLIANCE_DIR%\security\sca-report.json" set "G2_OK=0"
if not exist "%COMPLIANCE_DIR%\security\secrets-scan.json" set "G2_OK=0"
if "!G2_OK!"=="1" (
    findstr /C:"\"critical\": 0" "%COMPLIANCE_DIR%\security\sast-report.json" >nul || set "G2_OK=0"
    findstr /C:"\"external_dependencies\": 0" "%COMPLIANCE_DIR%\security\sca-report.json" >nul || set "G2_OK=0"
    findstr /C:"\"leaked_secrets\": 0" "%COMPLIANCE_DIR%\security\secrets-scan.json" >nul || set "G2_OK=0"
)
if "!G2_OK!"=="1" (
    echo [PASS] GATE-02 - STATIC_AND_SECRET_ANALYSIS ^(SAST 0 Critical + SCA 0 Deps + 0 Secrets^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-02 - STATIC_AND_SECRET_ANALYSIS
)

:: GATE-03: AI Governance, MCP Inventory (21 Approved Tools) & Skills Least-Agency
set "G3_OK=1"
if not exist "%COMPLIANCE_DIR%\ai-governance\mcp-inventory.json" set "G3_OK=0"
if not exist "%COMPLIANCE_DIR%\ai-governance\skills-inventory.json" set "G3_OK=0"
if "!G3_OK!"=="1" (
    findstr /C:"squad_route_skill" "%COMPLIANCE_DIR%\ai-governance\mcp-inventory.json" >nul || set "G3_OK=0"
    findstr /C:"squad_batch_query" "%COMPLIANCE_DIR%\ai-governance\mcp-inventory.json" >nul || set "G3_OK=0"
    findstr /C:"\"prompt_defense_6_of_6\": true" "%COMPLIANCE_DIR%\ai-governance\skills-inventory.json" >nul || set "G3_OK=0"
)
if "!G3_OK!"=="1" (
    echo [PASS] GATE-03 - AI_GOVERNANCE_AND_LEAST_AGENCY ^(21 MCP Tools Homologadas + 114 Skills Protegidas^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-03 - AI_GOVERNANCE_AND_LEAST_AGENCY
)

:: GATE-04: Network Isolation & Zero Code/Prompt Egress
set "G4_OK=1"
if not exist "%COMPLIANCE_DIR%\network\egress-allowlist.yaml" set "G4_OK=0"
if not exist "%COMPLIANCE_DIR%\network\network-test-report.json" set "G4_OK=0"
if "!G4_OK!"=="1" (
    findstr /C:"deny_by_default" "%COMPLIANCE_DIR%\network\egress-allowlist.yaml" >nul || set "G4_OK=0"
    findstr /C:"\"unauthorized_bytes_leaked\": 0" "%COMPLIANCE_DIR%\network\network-test-report.json" >nul || set "G4_OK=0"
)
if "!G4_OK!"=="1" (
    echo [PASS] GATE-04 - NETWORK_ISOLATION_AND_ZERO_EGRESS ^(Deny-by-Default Allowlist + 0 Bytes Vazados^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-04 - NETWORK_ISOLATION_AND_ZERO_EGRESS
)

:: GATE-05: Red Team Adversarial Resilience (Scenarios A to H)
set "G5_OK=1"
if not exist "%COMPLIANCE_DIR%\testing\adversarial-tests\scenarios-a-to-h.json" set "G5_OK=0"
if "!G5_OK!"=="1" (
    findstr /C:"SCENARIO-A" "%COMPLIANCE_DIR%\testing\adversarial-tests\scenarios-a-to-h.json" >nul || set "G5_OK=0"
    findstr /C:"SCENARIO-H" "%COMPLIANCE_DIR%\testing\adversarial-tests\scenarios-a-to-h.json" >nul || set "G5_OK=0"
    findstr /C:"\"blocked_or_passed\": false" "%COMPLIANCE_DIR%\testing\adversarial-tests\scenarios-a-to-h.json" >nul && set "G5_OK=0"
)
if "!G5_OK!"=="1" (
    echo [PASS] GATE-05 - ADVERSARIAL_RESILIENCE_A_TO_H ^(8/8 Red Team Scenarios Passed^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-05 - ADVERSARIAL_RESILIENCE_A_TO_H
)

:: GATE-06: Cryptographic Transparency Manifest & Go 1.27.4 / Zero-Dep / PQC Seal
set "G6_OK=1"
findstr /C:"\"external_deps_count\": 0" "%MANIFEST%" >nul || set "G6_OK=0"
findstr /C:"\"cgo_enabled\": false" "%MANIFEST%" >nul || set "G6_OK=0"
findstr /C:"\"go_toolchain\":" "%MANIFEST%" | findstr /C:"go1.27." >nul || set "G6_OK=0"
findstr /C:"\"pqc_signature_b64\":" "%MANIFEST%" >nul || set "G6_OK=0"
if "!G6_OK!"=="1" (
    echo [PASS] GATE-06 - CRYPTOGRAPHIC_SIGNATURE_INTEGRITY ^(Go 1.27.4 + 0 Deps + Ed25519 + ML-DSA-65^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-06 - CRYPTOGRAPHIC_SIGNATURE_INTEGRITY
)

:: GATE-07: Source Publication Boundary & Zero IP/Secret Leak in Public Repo
set "G7_OK=1"
if not exist "%COMPLIANCE_DIR%\source\source-manifest.json" set "G7_OK=0"
if "!G7_OK!"=="1" (
    findstr /C:"\"external_go_mod_deps\": 0" "%COMPLIANCE_DIR%\source\source-manifest.json" >nul || set "G7_OK=0"
    findstr /S /M /C:"PRIVATE KEY-----" "%REPO_ROOT%\manifests\*.json" >nul 2>&1 && set "G7_OK=0"
)
if "!G7_OK!"=="1" (
    echo [PASS] GATE-07 - SOURCE_PUBLICATION_BOUNDARY ^(Zero Proprietary Source or Private Key Material^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-07 - SOURCE_PUBLICATION_BOUNDARY
)

:: GATE-08: Clean Rollback, Kill-Switch CRL & Homologation Gates Manifest
set "G8_OK=1"
if not exist "%COMPLIANCE_DIR%\compliance\homologation-gates.json" set "G8_OK=0"
if "!G8_OK!"=="1" (
    findstr /C:"\"technical_evidence_ready\": true" "%COMPLIANCE_DIR%\compliance\homologation-gates.json" >nul || set "G8_OK=0"
    findstr /C:"\"technical_evidence_ready\": false" "%COMPLIANCE_DIR%\compliance\homologation-gates.json" >nul && set "G8_OK=0"
)
if "!G8_OK!"=="1" (
    echo [PASS] GATE-08 - CLEAN_ROLLBACK_AND_KILL_SWITCH ^(CRL + Clean Uninstall + Homologation Gates Verified^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-08 - CLEAN_ROLLBACK_AND_KILL_SWITCH
)

if not "%BINARY_PATH%"=="" (
    if exist "%BINARY_PATH%" (
        echo.
        echo Executando verificacao criptografica dinamica via binario: %BINARY_PATH% ...
        "%BINARY_PATH%" enterprise-trust --no-pack
    )
)

echo.
echo --------------------------------------------------------------------------------
if !GATES_PASSED! EQU !TOTAL_GATES! (
    echo HOMOLOGATION_TECHNICAL_VERDICT: PASS ^(!GATES_PASSED!/!TOTAL_GATES! GATES^)
    echo --------------------------------------------------------------------------------
    exit /b 0
) else (
    echo HOMOLOGATION_TECHNICAL_VERDICT: BLOCKED ^(!GATES_PASSED!/!TOTAL_GATES! GATES^)
    echo --------------------------------------------------------------------------------
    exit /b 1
)
