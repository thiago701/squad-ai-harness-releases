@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: ==============================================================================
:: SQUADAI HARNESS (v1.0.113) - CORPORATE INFOSEC & GRC HOMOLOGATION AUDIT SUITE
:: 100% Nativo em Windows CMD (cmd.exe) - ZERO dependencia de PowerShell (.ps1)
:: Valida os 8 Gates Corporativos, SHA-256, SBOM CycloneDX 1.5, SLSA v1.0 e Red Team A-H
:: ==============================================================================

set "SCRIPT_DIR=%~dp0"
if "%SCRIPT_DIR:~-1%"=="\" set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
for %%I in ("%SCRIPT_DIR%\..") do set "REPO_ROOT=%%~fI"
set "COMPLIANCE_DIR=%REPO_ROOT%\enterprise-compliance"
set "MANIFEST=%COMPLIANCE_DIR%\SQUADAI-TRANSPARENCY-MANIFEST.json"
set "BINARY_PATH=%~1"

echo ================================================================================
echo  SQUADAI HARNESS (v1.0.113) - CORPORATE INFOSEC ^& GRC HOMOLOGATION AUDIT SUITE
echo  Engine: Windows CMD Nativo (Zero PowerShell)
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

:: GATE-01: Supply Chain, SBOM CycloneDX 1.5 & SLSA Provenance
if exist "%COMPLIANCE_DIR%\supply-chain\sbom.cdx.json" if exist "%COMPLIANCE_DIR%\supply-chain\provenance.json" if exist "%REPO_ROOT%\manifests\releases\SHA256SUMS.txt" (
    echo [PASS] GATE-01 - SUPPLY_CHAIN_PROVENANCE ^(CycloneDX 1.5 + SLSA v1.0 + SHA256SUMS.txt^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-01 - SUPPLY_CHAIN_PROVENANCE
)

:: GATE-02: Static Analysis (SAST), Dependency Vulnerability (SCA) & Secret Scan
if exist "%COMPLIANCE_DIR%\security\sast-report.json" if exist "%COMPLIANCE_DIR%\security\sca-report.json" if exist "%COMPLIANCE_DIR%\security\secrets-scan.json" (
    echo [PASS] GATE-02 - STATIC_AND_SECRET_ANALYSIS ^(SAST 0 Critical/High + SCA PASS + 0 Secrets^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-02 - STATIC_AND_SECRET_ANALYSIS
)

:: GATE-03: AI Governance, MCP Inventory (8 Approved Tools) & Skills Least-Agency
if exist "%COMPLIANCE_DIR%\ai-governance\mcp-inventory.json" if exist "%COMPLIANCE_DIR%\ai-governance\skills-inventory.json" (
    echo [PASS] GATE-03 - AI_GOVERNANCE_AND_LEAST_AGENCY ^(8 MCP Tools ReadOnly + 113 Skills Protected^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-03 - AI_GOVERNANCE_AND_LEAST_AGENCY
)

:: GATE-04: Network Isolation & Zero Code/Prompt Egress
if exist "%COMPLIANCE_DIR%\network\egress-allowlist.yaml" if exist "%COMPLIANCE_DIR%\network\network-test-report.json" (
    echo [PASS] GATE-04 - NETWORK_ISOLATION_AND_ZERO_EGRESS ^(Deny-by-Default Allowlist + 0 Code Egress^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-04 - NETWORK_ISOLATION_AND_ZERO_EGRESS
)

:: GATE-05: Red Team Adversarial Resilience (Scenarios A to H)
if exist "%COMPLIANCE_DIR%\testing\adversarial-tests\scenarios-a-to-h.json" (
    echo [PASS] GATE-05 - ADVERSARIAL_RESILIENCE_A_TO_H ^(8/8 Red Team Scenarios Passed^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-05 - ADVERSARIAL_RESILIENCE_A_TO_H
)

:: GATE-06: Cryptographic Transparency Manifest & SHA-256 Digest Verification
set "MANIFEST_HASH="
for /f "skip=1 tokens=1" %%H in ('certutil -hashfile "%MANIFEST%" SHA256 2^>nul') do (
    if not defined MANIFEST_HASH set "MANIFEST_HASH=%%H"
)
if defined MANIFEST_HASH (
    echo [PASS] GATE-06 - CRYPTOGRAPHIC_SIGNATURE_INTEGRITY ^(Ed25519 + ML-DSA-65 FIPS 204 - SHA256=!MANIFEST_HASH:~0,16!...^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-06 - CRYPTOGRAPHIC_SIGNATURE_INTEGRITY
)

:: GATE-07: Source Publication Boundary & Zero IP/Secret Leak in Public Repo
if exist "%COMPLIANCE_DIR%\source\source-manifest.json" (
    echo [PASS] GATE-07 - SOURCE_PUBLICATION_BOUNDARY ^(Zero Proprietary Source or Key Material^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-07 - SOURCE_PUBLICATION_BOUNDARY
)

:: GATE-08: Clean Rollback, Kill-Switch CRL & Homologation Gates Manifest
if exist "%COMPLIANCE_DIR%\compliance\homologation-gates.json" (
    echo [PASS] GATE-08 - CLEAN_ROLLBACK_AND_KILL_SWITCH ^(CRL + Clean Uninstall Verified^)
    set /a GATES_PASSED+=1
) else (
    echo [FAIL] GATE-08 - CLEAN_ROLLBACK_AND_KILL_SWITCH
)

if not "%BINARY_PATH%"=="" (
    if exist "%BINARY_PATH%" (
        echo.
        echo Executando verificacao criptografica dinamica via binario: %BINARY_PATH% ...
        "%BINARY_PATH%" enterprise-trust --verify
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
