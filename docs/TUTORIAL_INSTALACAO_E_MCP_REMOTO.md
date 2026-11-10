# Guia Oficial de Instalação Multi-Estação via GitHub Releases (`SquadAI Harness`)

> **Versão:** `v1.0.113` · **Modo de Operação:** `Zero-Admin` / `Zero-ZIP` / `Zero-PowerShell` (Arquivo Único `.sh` Autossuficiente via Git Bash / Bash)
> **Repositório Oficial de Releases Públicas (SquadAI Harness — Official Releases):** [`https://github.com/thiago701/squad-ai-harness-releases`](https://github.com/thiago701/squad-ai-harness-releases)
> **Instaladores Oficiais de Arquivo Único (`4,04 MB` com as 113 Skills Embutidas):** `setup-squad-ai-windows.sh` (Windows) · `setup-squad-ai-linux.sh` (Linux) · `setup-squad-ai-macos.sh` (macOS)

---

## 1. Objetivo e Arquitetura

Este documento descreve o procedimento padronizado para instalar a **SquadAI Harness (`v1.0.113`)** em **qualquer computador Windows (10 ou 11), Linux ou macOS** — com ou sem GPU/NPU dedicada, sem exigir privilégios de Administrador, **sem precisar clonar o repositório**, **sem precisar descompactar arquivos `.zip`** e **sem depender do Windows PowerShell (`powershell.exe` / `.ps1`)** — a partir do repositório público oficial (**SquadAI Harness — Official Releases** · `squad-ai-harness-releases`), permitindo:

1. **Instalação Autossuficiente em Arquivo Único (`setup-squad-ai-windows.sh` no Git Bash):**
   - O arquivo `setup-squad-ai-windows.sh` (`4,04 MB`) traz **embutido todo o catálogo das 113 skills completas** (`SKILL.md` + `references/` + `scripts/` + `assets/`, totalizando 968 arquivos comprimidos em `tar.gz` Base64).
   - **Pastas Padrão Criadas no `$HOME` (`claude`, `codex`, `gemini` e `copilot`):** Mesmo que ainda não existam na máquina, cria automaticamente no `$HOME` (`%USERPROFILE%`) os diretórios `~/.claude/skills`, `~/.codex/skills`, `~/.gemini/config/skills`, `~/.gemini/skills` e `~/.copilot/skills` contendo as **113 skills instaladas**. As demais ferramentas (`~/.cursor`, `~/.codeium/windsurf`, `~/.cline`, `~/.qwen`, `~/.dsh`, `~/.opencode` e `Workstation CLI`) só são provisionadas se o diretório raiz da ferramenta existir de fato no computador.
   - **Ativação Complementar de NPU e GPU no Setup Wizard:** Durante o Setup Wizard, o instalador explica como cada recurso será utilizado e suas vantagens, perguntando ao desenvolvedor se deseja ativar o uso da **NPU** e da **GPU**, gravando automaticamente `~/.squad-ai/workstation.json`.
   - **Desinstalação Seletiva (`--uninstall`):** Remove **apenas as skills pertencentes à SquadAI**, preservando 100% das skills autorais do desenvolvedor em todas as ferramentas (inclusive no `Workstation CLI`).
   - **Confirmação Explícita no Final:** Exibe banner visual **`[SUCESSO]`** ou **`[FALHA]`** ao encerrar a execução.

---

## 2. Passo 1 — Obter o Instalador (Baixando o Repositório ou via GitHub Releases)

Os scripts instaladores (**`setup-squad-ai.sh`**, **`setup-squad-ai-windows.sh`**, **`setup-squad-ai-linux.sh`** e **`setup-squad-ai-macos.sh`**) ficam **mantidos diretamente na raiz do repositório** (além da aba **Releases**), permitindo instalar em **qualquer Sistema Operacional (Windows, Linux, macOS)** mesmo em redes corporativas que bloqueiam downloads de `releases/download`:

### Opção A — Baixando ou Clonando o Repositório (Recomendado)

1. Clone o repositório (ou clique no botão verde **`<> Code -> Download ZIP`** na página principal do repositório no GitHub):
   ```bash
   git clone https://github.com/thiago701/squad-ai-harness-releases.git
   cd squad-ai-harness-releases
   ```
2. Execute o script `.sh` diretamente da raiz do repositório no seu Sistema Operacional:
   ```bash
   # Windows 10 / 11 (Git Bash):
   bash ./setup-squad-ai-windows.sh

   # Linux (Ubuntu, Debian, Mint, RHEL, Fedora, WSL2):
   bash ./setup-squad-ai-linux.sh

   # macOS (Apple Silicon M1–M4 & Intel):
   bash ./setup-squad-ai-macos.sh

   # Ou use o instalador universal presente na raiz:
   bash ./setup-squad-ai.sh
   ```

### Opção B — Download Direto do Arquivo Único na Aba Releases (Sem Clonar Repositório)

1. Acesse a página oficial de Releases do repositório público (**SquadAI Harness — Official Releases**):
   - **`https://github.com/thiago701/squad-ai-harness-releases/releases/latest`**
2. Baixe apenas o instalador de arquivo único correspondente ao seu Sistema Operacional:
   - **Windows 10 / 11 (Git Bash):** **`setup-squad-ai-windows.sh`** (`4,04 MB`)
   - **Linux (Ubuntu / Debian / Mint / WSL2 / Fedora):** **`setup-squad-ai-linux.sh`** (`4,04 MB`) ou **`squad-ai-harness_1.0.113_amd64.deb`**
   - **macOS (Apple Silicon M1–M4 & Intel):** **`setup-squad-ai-macos.sh`** (`4,04 MB`)
3. *(Opcional)* Confira a integridade do arquivo com o `SHA256SUMS.txt` publicado na Release (via Git Bash / Terminal):
   ```bash
   sha256sum setup-squad-ai-windows.sh
   ```

---

## 3. Passo 2 — Executar o Assistente de Instalação (`setup-squad-ai-*.sh`)

1. Abra o **Git Bash** (Windows) ou **Terminal** (Linux/macOS) na pasta do repositório ou onde baixou o script `.sh`.
2. Execute o Setup Wizard interativo ou passe a flag desejada:
   ```bash
   # Modo Interativo (Menu [1] INSTALAR, [2] REINSTALAR, [3] DESINSTALAR, [4] AUDITORIA):
   bash ./setup-squad-ai-windows.sh

   # Instalação Direta das 113 Skills + Calibração Automática NPU/GPU:
   bash ./setup-squad-ai-windows.sh --install

   # Reinstalar / Atualizar preservando o Identificador (QID):
   bash ./setup-squad-ai-windows.sh --reinstall

   # Auditoria de Homologação Corporativa InfoSec/GRC (8 Gates em Sandbox):
   bash ./setup-squad-ai-windows.sh --audit

   # Desinstalação Seletiva (remove apenas as skills da SquadAI, preservando as skills do dev):
   bash ./setup-squad-ai-windows.sh --uninstall
   ```
3. No modo interativo, o menu exibido é:

```text
===============================================================================
  SQUAD AI HARNESS v1.0.113 — SETUP WIZARD OFICIAL (MULTI-OS / ZERO-ADMIN)
===============================================================================
  Estacao / SO        : <NOME-DO-COMPUTADOR> (Usuario: <SEU-USUARIO>)
  Identificador (QID) : QUID-SQ8-XXXXXXXX-XXXXXXXX
-------------------------------------------------------------------------------
  [1] INSTALAR      - Instalacao Limpa + Ativacao NPU/GPU + Relatorio (113 Skills)
  [2] REINSTALAR    - Reparar / Atualizar preservando QID (Incrementa Geracao)
  [3] DESINSTALAR   - Remocao Seletiva (Mantem skills autorais do dev)
  [4] AUDITORIA     - Homologacao Corporativa InfoSec / GRC (8 Gates em Sandbox)
  [0] SAIR          - Encerrar o Setup Wizard
```

4. Durante a etapa de hardware do Setup Wizard, o instalador pergunta ao desenvolvedor:
   - **Ativação da NPU:** explica que a NPU acelera em tempo real (`~7 ms` na Camada C1 FP16) o roteamento semântico de especialistas e consultas locais com consumo mínimo de bateria e sem sobrecarregar a CPU.
   - **Ativação da GPU:** explica que a GPU (Integrada ou Dedicada CUDA/DirectML) acelera em até `10x` a indexação vetorial em lote do repositório, o grafo de conhecimento (`SEKG`) e cálculos matriciais pesados sem travar a IDE.

5. Ao final da execução, o instalador exibe a **mensagem de confirmação explícita de sucesso ou falha**:

```text
===============================================================================
  [SUCESSO] OPERACAO CONCLUIDA COM EXITO NO SETUP-SQUAD-AI.SH!
  Detalhes : Instalacao concluida (113 skills provisionadas; defaults: claude, codex, gemini e copilot no HOME)
===============================================================================
```

---

## 4. Solução de Problemas Comuns (Troubleshooting)

| Sintoma | Causa Provável | Solução Recomendada |
|---|---|---|
| Bloqueio corporativo de PowerShell (`.ps1` / `ExecutionPolicy`) | Estações corporativas frequentemente bloqueiam a execução de scripts `.ps1` baixados da internet (`Zone.Identifier`). | O instalador `v1.0.113` **não utiliza PowerShell nem `.zip`**: execute diretamente **`bash ./setup-squad-ai-windows.sh`** no Git Bash. |
| NPU ou GPU não detectada automaticamente | Equipamento opera apenas com CPU ou os drivers de aceleração ainda não foram carregados. | O runtime utiliza automaticamente a **Camada C0 (Go Nativo SIMD)** em CPU com latência sub-milissegundo, sem perda funcional. |
