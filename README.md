# SquadAI Harness — Official Releases (v0.9.112)

<div align="center">
  <img src="assets/logo-squad-ai-harness.jpg" alt="SquadAI Harness — Official Releases" width="100%" />

  <!-- Matriz de Plataformas e Tecnologias Suportadas -->
  <table>
    <thead>
      <tr>
        <th align="left">Domínio</th>
        <th align="left">Plataformas e Tecnologias Suportadas</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td nowrap="nowrap"><strong>📦 Release &amp; Ambiente</strong></td>
        <td align="left">
          <a href="manifests/releases/v0.9.112-release-manifest.json"><img src="https://img.shields.io/badge/Version-v0.9.112-2563EB?style=flat-square" alt="Version" /></a>
          <a href="docs/installation.md"><img src="https://img.shields.io/badge/OS-Windows%2010%2F11%20%7C%20Linux%20.deb%20%7C%20macOS-F59E0B?style=flat-square" alt="Multi-OS Installer" /></a>
          <a href="manifests/releases/v0.9.112-sbom.cdx.json"><img src="https://img.shields.io/badge/SBOM-CycloneDX%201.5-AB47BC?style=flat-square" alt="SBOM" /></a>
          <a href="audit/audit-infosec.cmd"><img src="https://img.shields.io/badge/InfoSec%20Audit-8%2F8%20Gates%20PASS-00C853?style=flat-square" alt="InfoSec Audit" /></a>
        </td>
      </tr>
      <tr>
        <td nowrap="nowrap"><strong>☕ Backend &amp; Sistemas</strong></td>
        <td align="left">
          <img src="https://img.shields.io/badge/Java-21%20%7C%2025%20LTS%20%7C%2026%2F27-ED8B00?style=flat-square&logo=openjdk&logoColor=white" alt="Java 25 LTS" />
          <img src="https://img.shields.io/badge/Spring%20Boot-4.x%20%2F%20Framework%207-6DB33F?style=flat-square&logo=springboot&logoColor=white" alt="Spring Boot 4" />
          <img src="https://img.shields.io/badge/Quarkus-3.39%20%2B%20GraalVM%20Native%20AOT-4695EB?style=flat-square&logo=quarkus&logoColor=white" alt="Quarkus AOT" />
          <img src="https://img.shields.io/badge/Go-1.24%E2%80%931.27%20Cloud%20Native-00ADD8?style=flat-square&logo=go&logoColor=white" alt="Go Cloud Native" />
          <img src="https://img.shields.io/badge/Rust-1.99%20(Edition%202024)-000000?style=flat-square&logo=rust&logoColor=white" alt="Rust 1.99" />
          <img src="https://img.shields.io/badge/.NET%2010%20LTS-C%23%2014%20Native%20AOT-512BD4?style=flat-square&logo=dotnet&logoColor=white" alt=".NET 10 C# 14" />
        </td>
      </tr>
      <tr>
        <td nowrap="nowrap"><strong>🐍 Python, Web &amp; UI</strong></td>
        <td align="left">
          <img src="https://img.shields.io/badge/Python-3.13%20%7C%203.14%20Free--Threaded-3776AB?style=flat-square&logo=python&logoColor=white" alt="Python 3.14" />
          <img src="https://img.shields.io/badge/FastAPI-Async%20%2B%20uv-009688?style=flat-square&logo=fastapi&logoColor=white" alt="FastAPI" />
          <img src="https://img.shields.io/badge/Node.js-24%20LTS%20%7C%2026%20(Fastify%2FExpress)-339933?style=flat-square&logo=nodedotjs&logoColor=white" alt="Node.js 24/26" />
          <img src="https://img.shields.io/badge/TypeScript-7.0%20(tsgo%20Native)-3178C6?style=flat-square&logo=typescript&logoColor=white" alt="TypeScript 7" />
          <img src="https://img.shields.io/badge/Angular-21%2F22%20Signals%20%2B%20WCAG%202.2-DD0031?style=flat-square&logo=angular&logoColor=white" alt="Angular 22" />
        </td>
      </tr>
      <tr>
        <td nowrap="nowrap"><strong>☁️ AWS, Serverless &amp; IaC</strong></td>
        <td align="left">
          <img src="https://img.shields.io/badge/AWS-Lambda%20%7C%20ECS%20Fargate%20%7C%20Step%20Functions-FF9900?style=flat-square&logo=amazonwebservices&logoColor=white" alt="AWS Cloud" />
          <img src="https://img.shields.io/badge/AWS%20EDA-API%20Gateway%20%7C%20EventBridge%20%7C%20SQS%20%7C%20SNS-FF4F8B?style=flat-square&logo=amazonwebservices&logoColor=white" alt="AWS Event-Driven" />
          <img src="https://img.shields.io/badge/Streaming%20%26%20IoT-Kinesis%20%7C%20MSK%20Kafka%20%7C%20IoT%20Core-232F3E?style=flat-square&logo=apachekafka&logoColor=white" alt="AWS Streaming & IoT" />
          <img src="https://img.shields.io/badge/IaC-Terraform%20HCL%20%7C%20AWS%20SAM%20%7C%20CDK-844FBA?style=flat-square&logo=terraform&logoColor=white" alt="Terraform IaC" />
          <img src="https://img.shields.io/badge/Zero%20Trust-HashiCorp%20Vault%20%2B%20AWS%20VPC-000000?style=flat-square&logo=vault&logoColor=white" alt="HashiCorp Vault" />
          <img src="https://img.shields.io/badge/Local%20Cloud-LocalStack%20%2B%20Trace2Local-47A248?style=flat-square&logo=docker&logoColor=white" alt="LocalStack" />
        </td>
      </tr>
      <tr>
        <td nowrap="nowrap"><strong>🗄️ Dados, Obs, AppSec &amp; QA</strong></td>
        <td align="left">
          <img src="https://img.shields.io/badge/Databases-PostgreSQL%20%7C%20Aurora%20%7C%20DynamoDB%20%7C%20Redis-4169E1?style=flat-square&logo=postgresql&logoColor=white" alt="Databases" />
          <img src="https://img.shields.io/badge/Data%20Modeling-DBML%20%2B%20Single--Table%20%2B%20Outbox-003B57?style=flat-square&logo=databricks&logoColor=white" alt="DBML" />
          <img src="https://img.shields.io/badge/Observability-Datadog%20APM%2FLogs%20%7C%20OpenTelemetry%20%7C%20CloudWatch-632CA6?style=flat-square&logo=datadog&logoColor=white" alt="Datadog & OTel" />
          <img src="https://img.shields.io/badge/AppSec-OWASP%20%7C%20Veracode%20%7C%20Checkov%20%7C%20Trivy-DC2626?style=flat-square&logo=owasp&logoColor=white" alt="Security & SAST" />
          <img src="https://img.shields.io/badge/Testing-Testcontainers%20%7C%20Playwright%20%7C%20k6%20%7C%20AWS%20FIS%20Chaos-2EAD33?style=flat-square&logo=playwright&logoColor=white" alt="QA & Chaos" />
        </td>
      </tr>
      <tr>
        <td nowrap="nowrap"><strong>🤖 IA Agêntica, GPU &amp; MCP</strong></td>
        <td align="left">
          <img src="https://img.shields.io/badge/Agentic%20AI-MCP%20%7C%20A2A%20%7C%20LangGraph%20%7C%20RAG-7C3AED?style=flat-square&logo=anthropic&logoColor=white" alt="AI & Agents" />
          <img src="https://img.shields.io/badge/LLM%20%26%20Evals-Claude%20%7C%20Gemini%20%7C%20Bedrock%20%7C%20Agent%20Evals-D97706?style=flat-square&logo=googlecloud&logoColor=white" alt="LLM Providers" />
          <img src="https://img.shields.io/badge/Hardware%20%26%20CV-NVIDIA%20CUDA%20%7C%20Intel%20iGPU%20%7C%20NPU%20%7C%20OpenCV-76B900?style=flat-square&logo=nvidia&logoColor=white" alt="GPU & CV" />
          <img src="https://img.shields.io/badge/IDEs%20Suportadas-Claude%20%7C%20Antigravity%20%7C%20Cursor%20%7C%20Copilot%20%7C%20Codex%20%7C%20Windsurf-1E293B?style=flat-square" alt="12 Agentic IDEs" />
        </td>
      </tr>
    </tbody>
  </table>
</div>

---

## 1. O que é o SquadAI Harness

O **SquadAI Harness** é uma ferramenta de apoio à engenharia de software que disponibiliza especialistas técnicos (arquitetura, desenvolvimento backend/frontend, banco de dados, nuvem AWS, testes e segurança) diretamente na sua IDE ou terminal via **Model Context Protocol (MCP)**.

Este repositório (`squad-ai-harness-releases`) reúne os **instaladores oficiais**, os **guias de uso** e os **scripts de verificação de segurança** da versão `v0.9.112`.

---

## 2. Ferramentas e IDEs Compatíveis

O instalador configura automaticamente a integração com as ferramentas presentes na sua máquina:
- **Claude Code / Cowork** (`~/.claude/skills`)
- **Google Antigravity** (`~/.gemini/config/skills`)
- **Cursor IDE** (`~/.cursor/skills`)
- **GitHub Copilot Agent** (`~/.copilot/skills`)
- **OpenAI Codex CLI** (`~/.codex/skills`)
- **Windsurf IDE** (`~/.codeium/windsurf/skills`)
- **Gemini CLI**, **Cline / Roo Code**, **Qwen Code CLI**, **DeepSeek Harness** e **OpenCode CLI**

---

## 3. Requisitos de Sistema

| Sistema Operacional | Arquiteturas | Requisitos Mínimos |
|---|---|---|
| **Windows 10 / 11** | `amd64`, `arm64` | Prompt de Comando (`cmd.exe`) ou Git Bash (`bash`), 4 GB RAM, 200 MB em disco |
| **Linux (Ubuntu 22.04+, Debian 12+)** | `amd64`, `arm64` | Terminal padrão (`bash`), 4 GB RAM, 200 MB em disco |
| **macOS 14+** | `arm64`, `amd64` | Terminal padrão, 4 GB RAM, 200 MB em disco |

---

## 4. Como Instalar, Reinstalar e Desinstalar

### Windows 10 / 11 (Via Git Bash — Arquivo Único `setup-squad-ai-windows.sh`)

1. Acesse a aba **[Releases](../../releases)** e baixe diretamente o arquivo `setup-squad-ai-windows.sh` (sem necessidade de descompactar arquivo `.zip`).
2. Abra o **Git Bash** na pasta onde baixou (ou clique duas vezes em `setup-squad-ai-windows.sh`) para abrir o Setup Wizard interativo (`[1] INSTALAR`, `[2] REINSTALAR`, `[3] DESINSTALAR`, `[4] AUDITORIA`), ou execute diretamente:

       # Instalar (112 skills)
       bash ./setup-squad-ai-windows.sh --install

       # Reinstalar / Reparar
       bash ./setup-squad-ai-windows.sh --reinstall

       # Auditoria de Homologação Corporativa (8 Gates + Laudo JSON)
       bash ./setup-squad-ai-windows.sh --audit

       # Desinstalar (Zero Resíduos)
       bash ./setup-squad-ai-windows.sh --uninstall

### Linux (Ubuntu / Debian / Mint / WSL2 / Fedora)

1. Baixe `setup-squad-ai-linux.sh` (ou o pacote Debian `squad-ai-harness_0.9.112_amd64.deb`) na aba **[Releases](../../releases)**.
2. No terminal, execute:

       bash ./setup-squad-ai-linux.sh
       # ou via pacote Debian:
       sudo dpkg -i squad-ai-harness_0.9.112_amd64.deb

### macOS (Apple Silicon M1–M4 & Intel)

1. Baixe `setup-squad-ai-macos.sh` na aba **[Releases](../../releases)** e execute no Terminal:

       bash ./setup-squad-ai-macos.sh

Consulte o passo a passo completo em [docs/installation.md](docs/installation.md).

---

## Como Usar na sua IDE

Após concluir a instalação, abra o chat da sua IDE (**Claude Code**, **Google Antigravity**, **GitHub Copilot**, **Cursor**, **Windsurf** ou **Codex**) e envie comandos em linguagem natural:

| Objetivo | Exemplo de Comando no Chat da IDE |
|---|---|
| **Iniciar um projeto ou funcionalidade com a equipe completa** | `"Squad ai, prepare a equipe"` |
| **Listar todos os 112 especialistas e domínios disponíveis** | `"Squad ai, quais suas habilidades?"` |
| **Investigar a causa raiz de um erro ou falha de build/runtime** | `"Squad ai, investigue a causa raiz deste erro"` |
| **Revisar código com foco em arquitetura, segurança e performance** | `"Squad ai, revise este código com o Tech Lead e Engenheiro de Segurança"` |
| **Exibir o relatório executivo de uso e economia de tokens** | `"Squad ai, gere relatorio de uso"` |

---

## 5. Ativação e Troca de Computador

### Ativar na estação atual
Após instalar, ative sua estação informando seu e-mail cadastrado:

    squad-harness license activate --email seu.nome@empresa.com

### Transferir para um novo computador (ou após formatação)
Caso troque de computador ou formate o sistema operacional, recupere seu acesso na nova máquina:

    squad-harness license recover --email seu.nome@empresa.com --otp <CODIGO-VERIFICACAO>

Mais informações em [docs/licensing.md](docs/licensing.md).

---

## 6. Verificação de Integridade e Homologação de Segurança (InfoSec)

Antes de instalar ou distribuir internamente, você ou a equipe de Segurança da Informação da sua empresa podem validar a integridade dos arquivos e executar a checagem automatizada de conformidade:

### Conferir o Checksum `SHA-256`

No **Windows CMD (`cmd.exe`)**:

    certutil -hashfile setup-squad-ai-windows.sh SHA256
    type manifests\releases\SHA256SUMS.txt

No **Git Bash / Linux / macOS**:

    sha256sum setup-squad-ai-windows.sh setup-squad-ai-linux.sh setup-squad-ai-macos.sh
    cat manifests/releases/SHA256SUMS.txt

### Executar o Script de Homologação para Equipes de Segurança

No **Windows CMD (`cmd.exe`)**:

    audit\audit-infosec.cmd

No **Git Bash / Linux / macOS (`bash`)**:

    bash ./audit/verify-infosec-homologation.sh

Documentação para equipes de segurança e governança:
- [Roteiro de Homologação de Segurança Corporativa](docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md)
- [Guia de Conformidade Corporativa](docs/enterprise-compliance.md)
- [Diretório de Evidências e Relatórios (`enterprise-compliance/`)](enterprise-compliance/README-AUDIT.md)

---

## 7. Perguntas Frequentes (FAQ)

- **O instalador do Windows precisa do PowerShell ou de permissão de Administrador?**
  Não. O instalador `setup-squad-ai.sh` funciona diretamente via **Git Bash (`bash`)** em um único arquivo auditável, instalando as skills apenas na pasta do próprio usuário (`%USERPROFILE%`).
- **Como a equipe de Segurança da Informação pode auditar o instalador?**
  Basta executar `./setup-squad-ai.sh --audit` (ou escolher a opção `[4] AUDITORIA` no menu). O instalador executa os 8 Gates de verificação em Sandbox isolado e gera o laudo `homologation-audit-report.json`.
- **Como atualizo ou reparo uma instalação existente?**
  Basta executar `./setup-squad-ai.sh --reinstall` (ou opção `[2] REINSTALAR` no menu). Suas configurações locais são preservadas.
- **Como removo completamente a ferramenta?**
  Execute `./setup-squad-ai.sh --uninstall` (ou opção `[3] DESINSTALAR` no menu).

---

## 8. Documentação e Suporte

- [Visão Geral](docs/overview.md)
- [Arquitetura de Integração](docs/architecture.md)
- [Guia de Instalação](docs/installation.md)
- [Ativação e Troca de Computador](docs/licensing.md)
- [Solução de Problemas (Troubleshooting)](docs/troubleshooting.md)
- [Conformidade e Homologação de Segurança](docs/enterprise-compliance.md)
- [Política de Segurança](SECURITY.md) · [Privacidade](PRIVACY.md) · [Termos de Uso](LICENSE.md)
