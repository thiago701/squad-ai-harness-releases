# Licenciamento, Ativação e Recuperação de Equipamento

## Vínculo com Dispositivo (Device-Bound License)
Cada licença é vinculada ao par de chaves públicas gerado na instalação e protegido pelo armazenamento seguro do sistema operacional (TPM 2.0 / Windows DPAPI / macOS Keychain / Linux Keyring). Alterações periféricas (monitores, rede, USB) não invalidam a licença.

## Console Administrativo CloudFront (Licenças Ativas e Cadastros de Usuários)
Administradores autorizados gerenciam o ciclo de vida das licenças e o pré-cadastro de usuários por meio do Console Administrativo distribuído via AWS CloudFront com Origin Access Control (SigV4):
- **Licenças Ativas e Certificados:** inspeção de certificados assinados (`Ed25519 + ML-DSA-65`), renovação de janela offline, transferência administrativa de PC (*Force Rebind*) e revogação imediata na CRL.
- **Cadastro e Pré-Autorização de Usuários:** registro com pseudonimização `HMAC-SHA256` (LGPD), seleção de domínio (`enterprise-aws`, `personal-aws`, `personal-local`) e geração automática do comando de ativação.

## Recuperação e Substituição de Computador
Se você formatou seu computador ou trocou de máquina:
1. Execute `squad-harness license recover --email <seu-email> --otp <codigo-2fa>` ou solicite o *Force Rebind* no Console Administrativo.
2. O servidor revoga imediatamente a instalação anterior na CRL e emite uma nova licença vinculada ao novo hardware.
