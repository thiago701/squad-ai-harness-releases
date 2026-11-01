# Licenciamento, Ativação e Recuperação de Equipamento

## Vínculo com Dispositivo (Device-Bound License)
Cada licença é vinculada ao par de chaves públicas gerado na instalação e protegido pelo armazenamento seguro do sistema operacional (TPM 2.0 / Windows DPAPI / macOS Keychain / Linux Keyring). Alterações periféricas (monitores, rede, USB) não invalidam a licença.

## Recuperação e Substituição de Computador
Se você formatou seu computador ou trocou de máquina:
1. Execute `squad-harness license recover --email <seu-email> --otp <codigo-2fa>`.
2. O servidor revoga imediatamente a instalação anterior na CRL e emite uma nova licença vinculada ao novo hardware.
