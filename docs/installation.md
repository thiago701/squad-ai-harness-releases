# Guia de Instalação e Uso Multiplataforma (v0.9.112)

## Instalação por Sistema Operacional (Arquivo Único `.sh` — Sem `.zip`)
1. Baixe na seção **GitHub Releases** o instalador correspondente ao seu Sistema Operacional:
   - **Windows 10/11 (Git Bash):** `setup-squad-ai-windows.sh`
   - **Linux (Bash):** `setup-squad-ai-linux.sh` (ou `squad-ai-harness_0.9.112_amd64.deb`)
   - **macOS (Terminal):** `setup-squad-ai-macos.sh`
2. Confira o hash `SHA-256` contra `manifests/releases/SHA256SUMS.txt`.
3. Execute diretamente no **Git Bash / Terminal (`bash`)**:
   - Setup Wizard Interativo: `bash ./setup-squad-ai-windows.sh`
   - Instalar (112 skills): `bash ./setup-squad-ai-windows.sh --install`
   - Reinstalar/Reparar: `bash ./setup-squad-ai-windows.sh --reinstall`
   - Auditoria de Homologação (8 Gates): `bash ./setup-squad-ai-windows.sh --audit`
   - Desinstalar: `bash ./setup-squad-ai-windows.sh --uninstall`

## Como Usar na sua IDE Após a Instalação
Abra o chat da sua IDE (Claude Code, Antigravity, GitHub Copilot, Cursor, Windsurf ou Codex) e envie:
- `"Squad ai, prepare a equipe"` — Inicia o orquestrador e monta os especialistas ideais para a sua demanda.
- `"Squad ai, quais suas habilidades?"` — Exibe o catálogo completo dos 112 especialistas.
- `"Squad ai, investigue a causa raiz deste erro"` — Aciona diagnóstico forense com evidências.
- `"Squad ai, gere relatorio de uso"` — Gera o relatório consolidado de horas e economia de tokens.
