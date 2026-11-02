# Conformidade e Homologação Corporativa

## Garantias de Segurança para Ambientes Corporativos
- **Processamento Local:** As análises e comandos locais rodam diretamente na estação do desenvolvedor, sem envio de código-fonte para fora da empresa.
- **Instalação no Perfil do Usuário:** Não requer privilégios de Administrador Local nem altera configurações globais do sistema operacional.
- **Desinstalação Limpa:** Remove os arquivos instalados sem deixar serviços em segundo plano.

## Como Executar a Verificação de Segurança (InfoSec — Zero PowerShell)
Equipes de Segurança da Informação podem validar todos os artefatos e relatórios em menos de 30 segundos:

1. **Windows CMD (`cmd.exe`):**
   ```cmd
   audit\audit-infosec.cmd
   ```
2. **Git Bash (Windows) / Linux / macOS (`bash`):**
   ```bash
   bash ./audit/verify-infosec-homologation.sh
   ```
3. **Roteiro Completo:** consulte [docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md](ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md) e [enterprise-compliance/README-AUDIT.md](../enterprise-compliance/README-AUDIT.md).
