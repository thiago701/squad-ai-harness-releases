# Guia Oficial de Instalação Multi-Estação e Consulta Remota via MCP (`SquadAI Harness`)

> **Versão:** `v0.8.3` · **Modo de Operação:** `Zero-Admin` / `Zero-EXE` (Compatível com Estações Corporativas e Pessoais)
> **Repositório Oficial de Releases Públicas (SquadAI Harness — Official Releases):** [`https://github.com/thiago701/squad-ai-harness-releases`](https://github.com/thiago701/squad-ai-harness-releases)
> **Pacote Oficial de Release Windows:** `SquadAI-Installer-Windows-v0_8_3.zip`

---

## 1. Objetivo e Arquitetura

Este documento descreve o procedimento padronizado para instalar a **SquadAI Harness** em **qualquer computador Windows (10 ou 11)** — com ou sem GPU dedicada e sem exigir privilégios de Administrador — a partir do repositório público oficial (**SquadAI Harness — Official Releases** · `squad-ai-harness-releases`), permitindo:

1. **Instalação e Calibração Local com Duplo-Clique (`Instalar-SquadAI.cmd`):**
   - Detecção e calibração automática de **CPU, Memória RAM, GPU dedicada (`NVIDIA CUDA`), GPU integrada (`Intel Shared iGPU`) e NPU**.
   - Geração do **Identificador (`QID`)** único da estação (`QUID-SQ8-...`) e sincronização das skills nas ferramentas agênticas instaladas no perfil do usuário (`%USERPROFILE%`).
   - Operação **100% compatível com políticas corporativas restritas (`Zero-EXE` / `Zero-Admin`)**, sem modificar diretórios de sistema ou chaves de registro globais (`HKLM`).
2. **Comunicação MCP Segura e Consulta Remota de Relatórios entre Estações (`TLS 1.3`):**
   - Qualquer estação autorizada (`Estação B`) pode consultar em tempo real o **Relatório Executivo de Uso, Horas e Economia de Tokens (`squad_usage_report`)** e o **Diagnóstico de Hardware (`diagnostics.remote`)** de outra estação (`Estação A`) na mesma rede local (LAN) ou VPN/Tailscale.

```mermaid
sequenceDiagram
    autonumber
    participant Dist as GitHub Releases<br/>(squad-ai-harness-releases)
    participant EstA as Estação A (Origem do Relatório)<br/>(Servidor MCP TLS 1.3 :9443)
    participant EstB as Estação B (Qualquer PC / Workstation GPU)<br/>(Assistente Instalar-SquadAI.cmd)

    Dist->>EstB: Download de SquadAI-Installer-Windows-v0_8_3.zip (Validado por SHA-256)
    Note over EstB: Duplo-clique em Instalar-SquadAI.cmd<br/>Calibra CPU/GPU + Gera Identificador (QID) + Sincroniza Skills
    Note over EstA: Ativa Servidor MCP:<br/>"Squad ai, ligue o MCP" (Porta 9443)
    EstB->>EstA: Requisição MCP Segura (TLS 1.3 + Código de Pareamento)
    EstA-->>EstB: Relatório Executivo Consolidado (QID + 12 Ferramentas Agênticas)
```

---

## 2. Passo 1 — Baixar o Instalador Oficial no Computador de Destino

Em qualquer computador Windows onde deseje instalar a SquadAI Harness (sem precisar clonar código-fonte):

### Opção A — Download Direto via GitHub Releases (Recomendado)

1. Acesse a página oficial de Releases do repositório público (**SquadAI Harness — Official Releases**):
   - **`https://github.com/thiago701/squad-ai-harness-releases/releases/latest`**
2. Baixe o pacote empacotado correspondente à versão atual:
   - **`SquadAI-Installer-Windows-v0_8_3.zip`**
   - *(Opcional)* Confira a integridade do pacote com o arquivo `SHA256SUMS.txt` publicado na Release:
     ```powershell
     Get-FileHash .\SquadAI-Installer-Windows-v0_8_3.zip -Algorithm SHA256
     ```
3. Extraia o arquivo `SquadAI-Installer-Windows-v0_8_3.zip` em qualquer pasta do seu usuário (ex.: `C:\Users\<seu-usuario>\SquadAI`).

### Opção B — Download via Linha de Comando (PowerShell)

Se preferir baixar e extrair automaticamente pelo PowerShell (sem privilégio de Administrador):

```powershell
$ReleaseURL = "https://github.com/thiago701/squad-ai-harness-releases/releases/latest/download/SquadAI-Installer-Windows-v0_8_3.zip"
$DestZip    = "$env:USERPROFILE\Downloads\SquadAI-Installer-Windows-v0_8_3.zip"
$ExtractDir = "$env:LOCALAPPDATA\SquadAI\installer"

Invoke-WebRequest -Uri $ReleaseURL -OutFile $DestZip
Expand-Archive -Path $DestZip -DestinationPath $ExtractDir -Force
explorer.exe $ExtractDir
```

---

## 3. Passo 2 — Executar o Assistente de Instalação com Duplo-Clique

1. Abra a pasta onde o pacote `SquadAI-Installer-Windows-v0_8_3.zip` foi extraído.
2. **Dê um duplo-clique em `Instalar-SquadAI.cmd`**.
3. O **Assistente de Instalação Windows (Wizard)** será aberto automaticamente:

```text
===============================================================================
  SQUAD AI HARNESS v0.8.3 — ASSISTENTE DE INSTALACAO WINDOWS (MODO ZERO-EXE)   
  Seguranca Corporativa: 100% Texto Auditavel (.md/.json) · Sem Arquivos .EXE  
===============================================================================
  Estacao Detectada : <NOME-DO-COMPUTADOR> (Usuario: <SEU-USUARIO>)
  Escopo de Escrita : Somente pastas de usuario (%USERPROFILE%) · Zero-Admin
-------------------------------------------------------------------------------
  Escolha uma opcao (ou pressione ENTER para [1] Instalar em Modo Zero-EXE):
    [1] Instalar Skills (.md) + Calibrar GPU + Gerar Identificador (QID) [Sem .EXE]
    [2] Consultar Relatorio da SquadAI de outra Estacao via MCP
    [3] Desinstalar Skills das pastas do usuario

  Digite [1-3] (Padrao = 1):
```

4. **Pressione `ENTER`** (opção `1`). O Assistente realizará automaticamente:
   - **Calibração de Hardware e GPU:** Identifica CPU, memória RAM e placas gráficas instaladas (`NVIDIA CUDA`, `Intel Shared iGPU`, etc.).
   - **Geração do Identificador (`QID`):** Cria o identificador único da estação (`QUID-SQ8-...`) em `%USERPROFILE%\.squad-ai\station-profile.json`.
   - **Sincronização Multi-Ferramenta Agêntica:** Instala o catálogo de skills nas ferramentas agênticas detectadas na estação (Claude Code, Google Antigravity, Cursor, GitHub Copilot, OpenAI Codex, Windsurf, Gemini CLI, etc.).

---

## 4. Passo 3 — Ativar o Servidor MCP na Estação de Origem (`Estação A`)

Para permitir que outro computador (`Estação B`) consulte remotamente o **Relatório Executivo da SquadAI** ou o **Diagnóstico de Hardware** da `Estação A`:

1. Na **`Estação A`** (o computador que possui o relatório que você deseja consultar), execute o comando por linguagem natural:

```powershell
.\squad-harness.exe "Squad ai, ligue o MCP"
```

*(Ou execute a forma explícita parametrizando o nome lógico da estação e o código de pareamento desejado):*

```powershell
.\squad-harness.exe peer serve --station <NOME-DA-ESTACAO-A> --addr 0.0.0.0:9443 --pair-code SQUAD-LAB-2026
```

2. O terminal da `Estação A` confirmará que o servidor MCP `TLS 1.3` está ativo na porta `9443`:

```text
======================================================================
  SQUAD-AI HARNESS — SERVIDOR MCP PEER ATIVO (TLS 1.3 mTLS)
======================================================================
  Endpoint Escuta    : https://[::]:9443/mcp/v1/stream
  Código Pareamento  : SQUAD-LAB-2026
  Tools Publicadas   : squad_usage_report, diagnostics.remote, peers.health
======================================================================
```

3. Anote o endereço IP da `Estação A` na rede local ou VPN/Tailscale (obtido com `ipconfig` no Windows).

---

## 5. Passo 4 — Consultar o Relatório Remoto a partir de Qualquer Computador (`Estação B`)

Na **`Estação B`** (onde você acabou de rodar o instalador `Instalar-SquadAI.cmd`), você pode consultar o relatório da `Estação A` de duas maneiras:

### Maneira 1 — Pelo próprio Assistente `Instalar-SquadAI.cmd` (Sem Linha de Comando)

1. Ao final da instalação (ou dando duplo-clique em `Instalar-SquadAI.cmd` e escolhendo a opção **`2`**):
   ```text
   Informe o IP ou Hostname da Estacao com MCP ativo: <IP-DA-ESTACAO-A>
   ```
2. Digite o IP da `Estação A` e pressione **`ENTER`**.
3. O Assistente conectará via HTTPS (`TLS 1.3`) na porta `9443` da `Estação A` e exibirá na tela da `Estação B` o **Relatório Executivo da SquadAI** completo:
   - **`Identificador (QID)`** da estação consultada;
   - Horas trabalhadas com IA vs. Horas economizadas (últimos 3 meses);
   - Economia de tokens e economia financeira em USD;
   - Tabela de consolidação das **12 ferramentas agênticas**.

### Maneira 2 — Via Linha de Comando (PowerShell / CLI)

- **Em qualquer estação Windows (usando `curl.exe` nativo do Windows, sem precisar de `.exe` adicional):**
  ```powershell
  curl.exe -s -S -k -H "X-Squad-Pair-Code: SQUAD-LAB-2026" -H "X-Squad-Station: Estacao-Cliente" https://<IP-DA-ESTACAO-A>:9443/mcp/v1/report
  ```
- **Em estações com o binário `squad-harness.exe` (pareamento mútuo `mTLS` completo):**
  ```powershell
  # Obter o Relatório Executivo de Uso (QID):
  .\squad-harness.exe peer query --station <NOME-ESTACAO-B> --remote https://<IP-DA-ESTACAO-A>:9443 --pair-code SQUAD-LAB-2026 --tool squad_usage_report

  # Obter o Relatório de Diagnóstico de Hardware e GPU:
  .\squad-harness.exe peer query --station <NOME-ESTACAO-B> --remote https://<IP-DA-ESTACAO-A>:9443 --pair-code SQUAD-LAB-2026 --tool diagnostics.remote
  ```

---

## 6. Solução de Problemas Comuns (Troubleshooting)

| Sintoma | Causa Provável | Solução Recomendada |
|---|---|---|
| Timeout ao conectar em `https://<IP-DA-ESTACAO-A>:9443` | Os computadores estão em sub-redes isoladas (Wi-Fi corporativo/visitante com *AP Isolation*) ou o Firewall local bloqueou a porta `9443`. | Na `Estação A`, permita o acesso para **Redes Privadas** quando o Windows Defender Firewall solicitar, ou utilize uma rede overlay autenticada (**Tailscale** / túnel SSH local `ssh -L 9443:127.0.0.1:9443 usuario@<IP-DA-ESTACAO-A>`). |
| `ERR_INVALID_PAIR_CODE` | O código `--pair-code` informado na `Estação B` não coincide com o código iniciado na `Estação A`. | Certifique-se de utilizar o mesmo código de pareamento em ambas as pontas (padrão: `SQUAD-LAB-2026`). |
| Alerta de `ExecutionPolicy` no PowerShell | Política de execução de scripts restrita na sessão do Windows. | Inicie sempre pelo atalho `Instalar-SquadAI.cmd` (que já aplica `-NoProfile -ExecutionPolicy Bypass` apenas para o processo atual, sem alterar a política global da máquina). |
