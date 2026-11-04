# Guia de Instalação e Uso Multiplataforma (v1.0.113)

## Opção A — Baixando ou Clonando o Repositório (Recomendado)
Os instaladores `setup-squad-ai.sh`, `setup-squad-ai-windows.sh`, `setup-squad-ai-linux.sh` e `setup-squad-ai-macos.sh` ficam mantidos diretamente na raiz do repositório para execução imediata:
1. Clone o repositório (`git clone https://github.com/thiago701/squad-ai-harness-releases.git`) ou baixe o ZIP pelo botão **`<> Code -> Download ZIP`** do GitHub.
2. Na raiz da pasta baixada, execute diretamente no terminal do seu Sistema Operacional:
   - **Windows 10/11 (Git Bash):** `bash ./setup-squad-ai-windows.sh` (ou `bash ./setup-squad-ai.sh`)
   - **Linux (Bash):** `bash ./setup-squad-ai-linux.sh` (ou `bash ./setup-squad-ai.sh`)
   - **macOS (Terminal):** `bash ./setup-squad-ai-macos.sh` (ou `bash ./setup-squad-ai.sh`)

## Opção B — Instalação por Sistema Operacional via GitHub Releases (Arquivo Único `.sh` de `4,04 MB`)
1. Baixe na seção **GitHub Releases** (ou direto da árvore raiz do repositório) o instalador autossuficiente correspondente ao seu Sistema Operacional (todas as **113 skills completas** já estão embutidas no arquivo):
   - **Windows 10/11 (Git Bash):** `setup-squad-ai-windows.sh`
   - **Linux (Bash):** `setup-squad-ai-linux.sh` (ou `squad-ai-harness_1.0.113_amd64.deb`)
   - **macOS (Terminal):** `setup-squad-ai-macos.sh`
2. Confira o hash `SHA-256` contra `manifests/releases/SHA256SUMS.txt`.
3. Execute diretamente no **Git Bash / Terminal (`bash`)**:
   - Setup Wizard Interativo (`[1] INSTALAR`, `[2] REINSTALAR`, `[3] DESINSTALAR`, `[4] AUDITORIA`, `[5] LIGAR MCP`, `[6] VALIDAR PORTA`, `[7] RELATORIO MCP`): `bash ./setup-squad-ai-windows.sh`
   - Instalar (113 skills; cria `claude`, `codex`, `gemini` e `copilot` no `$HOME` por padrão): `bash ./setup-squad-ai-windows.sh --install`
   - Reinstalar/Reparar: `bash ./setup-squad-ai-windows.sh --reinstall`
   - Auditoria de Homologação (8 Gates): `bash ./setup-squad-ai-windows.sh --audit`
   - Ligar MCP / Validar Porta / Consultar Relatório MCP: `bash ./setup-squad-ai-windows.sh --serve-mcp`, `--check-port <IP> 9443`, `--report-mcp <IP> SQUAD-LAB-2026`
   - Desinstalação Seletiva (remove apenas skills da SquadAI, preservando as skills do dev): `bash ./setup-squad-ai-windows.sh --uninstall`
4. Ao final da execução, o instalador exibe um banner explícito de confirmação **`[SUCESSO]`** ou **`[FALHA]`**.

## Como Usar na sua IDE Após a Instalação
Abra o chat da sua IDE (Claude Code, Antigravity, GitHub Copilot, Cursor, Windsurf ou Codex) e envie:
- `"Squad ai, prepare a equipe"` — Inicia o orquestrador e monta os especialistas ideais para a sua demanda.
- `"Squad ai, quais suas habilidades?"` — Exibe o catálogo completo dos 113 especialistas.
- `"Squad ai, investigue a causa raiz deste erro"` — Aciona diagnóstico forense com evidências.
- `"Squad ai, gere relatorio de uso"` — Gera o relatório consolidado de horas e economia de tokens.
