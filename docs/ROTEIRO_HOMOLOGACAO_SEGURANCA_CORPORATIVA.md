# Roteiro de Homologação de Segurança Corporativa (InfoSec / AppSec / GRC)

> **Versão:** `v1.0.113` · **Público-Alvo:** Equipes de Segurança da Informação, AppSec e Governança de TI.
> **Objetivo:** Validar em ambiente de testes (*Sandbox*) a integridade dos pacotes e os relatórios de conformidade do **SquadAI Harness** antes de liberar o uso para os desenvolvedores — utilizando apenas **Windows CMD (`cmd.exe`)** ou **Git Bash (`bash`)**.

---

## 1. Características de Segurança da Instalação

1. **Sem Dependência do PowerShell e Sem Privilégios de Administrador:** O instalador para Windows opera em `cmd.exe` e Git Bash, gravando arquivos apenas no diretório do usuário (`%USERPROFILE%`).
2. **Processamento Local:** O motor local (`squad-harness`) responde às IDEs via protocolo MCP local (`stdio`), sem enviar código-fonte de projetos para servidores externos.
3. **Desinstalação Limpa:** O desinstalador remove integralmente os diretórios configurados no perfil do usuário.

---

## 2. Como Executar a Auditoria Automatizada (30 Segundos)

Este repositório contém os scripts de verificação em [`audit/`](../audit/) e os relatórios de conformidade em [`enterprise-compliance/`](../enterprise-compliance/).

### Opção A — Windows CMD (`cmd.exe`)

```cmd
audit\audit-infosec.cmd
```

### Opção B — Git Bash (Windows) / Linux / macOS (`bash`)

```bash
bash ./audit/verify-infosec-homologation.sh
```

---

## 3. Os 8 Controles Verificados Automaticamente

| Controle | Escopo Verificado | Artefatos Auditáveis |
|---|---|---|
| **GATE-01** | **Supply Chain & Provenance** | [`enterprise-compliance/supply-chain/sbom.cdx.json`](../enterprise-compliance/supply-chain/sbom.cdx.json) · [`manifests/releases/SHA256SUMS.txt`](../manifests/releases/SHA256SUMS.txt) |
| **GATE-02** | **Análise Estática e de Dependências** | [`enterprise-compliance/security/sast-report.json`](../enterprise-compliance/security/sast-report.json) · [`enterprise-compliance/security/sca-report.json`](../enterprise-compliance/security/sca-report.json) |
| **GATE-03** | **Governança de Ferramentas MCP** | [`enterprise-compliance/ai-governance/mcp-inventory.json`](../enterprise-compliance/ai-governance/mcp-inventory.json) |
| **GATE-04** | **Isolamento de Rede** | [`enterprise-compliance/network/egress-allowlist.yaml`](../enterprise-compliance/network/egress-allowlist.yaml) |
| **GATE-05** | **Testes de Resiliência (Cenários A–H)** | [`enterprise-compliance/testing/adversarial-tests/scenarios-a-to-h.json`](../enterprise-compliance/testing/adversarial-tests/scenarios-a-to-h.json) |
| **GATE-06** | **Integridade do Manifesto de Transparência** | [`enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json`](../enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json) |
| **GATE-07** | **Fronteira de Publicação** | [`enterprise-compliance/source/source-manifest.json`](../enterprise-compliance/source/source-manifest.json) |
| **GATE-08** | **Desinstalação Limpa e Controle de Acesso** | [`enterprise-compliance/compliance/homologation-gates.json`](../enterprise-compliance/compliance/homologation-gates.json) |

---

## 4. Resultado da Homologação

Ao final da execução de `audit\audit-infosec.cmd` ou `bash ./audit/verify-infosec-homologation.sh`, o script exibe o veredito técnico (`HOMOLOGATION_TECHNICAL_VERDICT: PASS (8/8 GATES)`), que pode ser anexado diretamente ao chamado interno de homologação da empresa.
