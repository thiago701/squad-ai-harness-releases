# Changelog Oficial

## [v0.8.3] - 2026-11-01
### Adicionado
- Instalador oficial condicionado à validação criptográfica de licença em 13 passos.
- Console Administrativo Web (AWS CloudFront + S3 Origin Access Control SigV4) para gestão de Licenças Ativas, Cadastro/Pré-Autorização de Usuários (LGPD HMAC-SHA256), Transferência de Equipamento (Force Rebind) e Lista de Revogação Criptográfica (CRL).
- Proteção integral do catálogo de especialistas via pacote cifrado `.sqenc` (`ML-KEM-768 + AES-256-GCM`).
- Manifesto de assinatura digital híbrida (`Ed25519 + ML-DSA-65`), SBOM CycloneDX 1.5 e proveniência SLSA v1.0.
- Documentação pública completa de conformidade corporativa (`ENTERPRISE_COMPLIANCE_MODE`).
