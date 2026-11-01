# Conformidade Corporativa e Bancária (Enterprise Compliance)

## Controles Garantidos no Modo Corporativo (`ENTERPRISE_COMPLIANCE_MODE`)
- **Isolamento de Rede (*Deny-by-Default*):** Nenhuma conexão com endpoints pessoais ou não homologados (`enterprise-compliance/network/egress-allowlist.yaml`).
- **Zero Egress de Código ou Prompts:** Toda avaliação sintática e de conformidade ocorre localmente no binário auditado.
- **Auditoria Criptográfica:** Eventos operacionais registrados localmente em cadeia `SHA-256` verificável pelo time de Segurança/SIEM.
- **Desinstalação e Rollback Limpos:** Remoção integral de artefatos sem resíduos ocultos no registro ou fora do diretório de usuário.

## Como Executar a Auditoria de Homologação (InfoSec / AppSec / GRC — Zero PowerShell)
Antes de liberar o uso para as equipes de desenvolvimento, o Departamento de Segurança pode homologar a ferramenta de ponta a ponta em menos de 30 segundos:

1. **Windows CMD (`cmd.exe`):**
   ```cmd
   audit\audit-infosec.cmd .\squad-harness.exe
   ```
2. **Git Bash (Windows) / Linux / macOS (`bash`):**
   ```bash
   bash ./audit/verify-infosec-homologation.sh ./squad-harness
   ```
3. **Roteiro Detalhado para Comitê de Segurança:** consulte [docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md](ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md) e o pacote de evidências em [enterprise-compliance/README-AUDIT.md](../enterprise-compliance/README-AUDIT.md).
