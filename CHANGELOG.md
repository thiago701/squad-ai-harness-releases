# Changelog Oficial

## [v0.8.3] - 2026-11-01
### Adicionado
- **Instalador Corporativo Zero-PowerShell (CMD + Git Bash + Wizard GUI HTML):** `Instalar-SquadAI.cmd`, `setup-squad-ai.sh` e `SquadAI-Wizard-GUI.html` operam 100% nativamente sem depender do Windows PowerShell (`ExecutionPolicy` / `Zone.Identifier`).
- **Suíte Completa de Auditoria e Homologação Corporativa (InfoSec / AppSec / GRC / Red Team):** scripts prontos para execução (`audit/audit-infosec.cmd` e `audit/verify-infosec-homologation.sh`), roteiro de homologação em Sandbox (`docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md`) e os 17 artefatos criptograficamente assinados em `enterprise-compliance/` (8 Gates Corporativos + Cenários Adversariais A–H).
- Instalador oficial condicionado à validação criptográfica de licença em 13 passos.
- Console Administrativo Web (AWS CloudFront + S3 Origin Access Control SigV4) para gestão de Licenças Ativas, Cadastro/Pré-Autorização de Usuários (LGPD HMAC-SHA256), Transferência de Equipamento (Force Rebind) e Lista de Revogação Criptográfica (CRL).
- Proteção integral do catálogo de especialistas via pacote cifrado `.sqenc` (`ML-KEM-768 + AES-256-GCM`).
- Manifesto de assinatura digital híbrida (`Ed25519 + ML-DSA-65`), SBOM CycloneDX 1.5 e proveniência SLSA v1.0.
- Documentação pública completa de conformidade corporativa (`ENTERPRISE_COMPLIANCE_MODE`).
