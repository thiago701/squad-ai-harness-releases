# Roteiro de Homologação e Auditoria Técnica para Departamentos de Segurança (InfoSec / AppSec / GRC)

> **Versão Alvo:** `v0.8.3` · **Público-Alvo:** CISO, Arquitetura de Segurança, AppSec, Red Team, SecOps/SOC e Governança de TI (GRC).
> **Objetivo:** Permitir que o Departamento de Segurança da empresa audite, valide em *Sandbox* e homologue tecnicamente o **SquadAI Harness** antes de liberar sua distribuição controlada para as estações dos desenvolvedores — **sem depender do Windows PowerShell** (utilizando apenas **Windows CMD `cmd.exe`** ou **Git Bash `bash`**).

---

## 1. Resumo Executivo para o Comitê de Segurança

O **SquadAI Harness** foi projetado desde a fundação para ambientes corporativos críticos, instituições financeiras e empresas sujeitas à **LGPD / GDPR / BACEN 4.893 / ISO 27001 / SOC 2 Type II**.

Diferentemente de extensões ou agentes interpretados que enviam código para nuvens desconhecidas ou baixam scripts dinâmicos da internet:
1. **Binário Único Estático e Assinado (`CGO_ENABLED=0`) + Instalador Zero-PowerShell:** Não instala *runtimes*, interpretadores secundários, serviços de *background* ocultos nem *drivers* de kernel, e não depende de políticas `ExecutionPolicy` do PowerShell (opera 100% em `cmd.exe`, Git Bash e GUI HTML offline).
2. **Zero Egress de Código-Fonte ou Prompts:** O motor local (`squad-harness`) executa determinismos arquiteturais, gates de qualidade e roteamento MCP **100% em memória local (`127.0.0.1` / `stdio`)**. Nenhum arquivo de repositório, prompt ou *diff* é transmitido ao servidor de licenciamento.
3. **Catálogo Cifrado em Repouso (`.sqenc`):** As capacidades são envelopadas com `ML-KEM-768 (FIPS 203) + AES-256-GCM` e abertas exclusivamente na memória RAM após validação criptográfica da licença (`Ed25519 + ML-DSA-65 FIPS 204`).
4. **Política de Rede *Deny-by-Default* (`ENTERPRISE_COMPLIANCE_MODE`):** Bloqueia qualquer comunicação com endpoints pessoais, operando apenas com os domínios autorizados pela empresa.
5. **Kill-Switch Imediato e Desinstalação Limpa:** Qualquer estação pode ter sua licença revogada instantaneamente via Lista de Revogação Criptográfica (**CRL**), e a remoção não deixa resíduos no Registro do Windows nem fora do perfil do usuário.

---

## 2. Como Executar a Auditoria Automatizada em Sandbox (30 Segundos — Zero PowerShell)

Este repositório público contém os scripts de verificação independente em [`audit/`](../audit/) e os 17 artefatos de evidência em [`enterprise-compliance/`](../enterprise-compliance/).

### Opção A — Windows CMD (`cmd.exe`)

Execute no Prompt de Comando na raiz deste repositório clonado (ou dentro de uma VM/Windows Sandbox):

```cmd
:: 1. Executar auditoria documental, criptográfica e de integridade dos 8 Gates Corporativos
audit\audit-infosec.cmd

:: 2. (Opcional) Incluir inspeção dinâmica do binário oficial baixado da Release v0.8.3
audit\audit-infosec.cmd .\squad-harness.exe
```

### Opção B — Git Bash (Windows) / Linux / macOS (`bash`)

```bash
bash ./audit/verify-infosec-homologation.sh ./squad-harness
```

### Opção C — Inspeção Direta pelo Binário Oficial (`enterprise-trust`)

Caso o analista de segurança já possua o binário oficial da release `v0.8.3`:

```cmd
:: Verifica a assinatura híbrida Ed25519 + ML-DSA-65 e revalida os 8 Gates localmente
squad-harness.exe enterprise-trust --verify --json

:: Executa a auditoria estrutural de repositório público (12 invariantes OSS-01..OSS-12)
squad-harness.exe oss-audit --json
```

---

## 3. Matriz dos 8 Gates de Homologação Corporativa

| Gate ID | Nome do Controle | Artefato Auditável no Repositório | Critério Técnico de Aprovação |
|---|---|---|---|
| **GATE-01** | **Supply Chain & Provenance** | [`enterprise-compliance/supply-chain/sbom.cdx.json`](../enterprise-compliance/supply-chain/sbom.cdx.json)<br>[`enterprise-compliance/supply-chain/provenance.json`](../enterprise-compliance/supply-chain/provenance.json)<br>[`manifests/releases/SHA256SUMS.txt`](../manifests/releases/SHA256SUMS.txt) | SBOM CycloneDX 1.5 completo, Proveniência SLSA v1.0 e hashes `SHA-256` idênticos aos binários publicados. |
| **GATE-02** | **Static, Dependency & Secret Analysis** | [`enterprise-compliance/security/sast-report.json`](../enterprise-compliance/security/sast-report.json)<br>[`enterprise-compliance/security/sca-report.json`](../enterprise-compliance/security/sca-report.json)<br>[`enterprise-compliance/security/secrets-scan.json`](../enterprise-compliance/security/secrets-scan.json) | `0 CRITICAL`, `0 HIGH` em SAST/SCA e `0` credenciais/chaves privadas expostas. |
| **GATE-03** | **AI Governance & Least Agency** | [`enterprise-compliance/ai-governance/mcp-inventory.json`](../enterprise-compliance/ai-governance/mcp-inventory.json)<br>[`enterprise-compliance/ai-governance/skills-inventory.json`](../enterprise-compliance/ai-governance/skills-inventory.json) | Todas as 8 tools MCP com `ReadOnly: true`, `Destructive: false` e `NetworkAccess: false`; 104 skills com *Prompt Defense Line*. |
| **GATE-04** | **Network Isolation & Zero Egress** | [`enterprise-compliance/network/egress-allowlist.yaml`](../enterprise-compliance/network/egress-allowlist.yaml)<br>[`enterprise-compliance/network/network-test-report.json`](../enterprise-compliance/network/network-test-report.json) | Política *Deny-by-Default* ativa; zero envio de código, prompts ou variáveis de ambiente. |
| **GATE-05** | **Adversarial Resilience (Cenários A–H)** | [`enterprise-compliance/testing/adversarial-tests/scenarios-a-to-h.json`](../enterprise-compliance/testing/adversarial-tests/scenarios-a-to-h.json) | 8/8 cenários Red Team bloqueados (Prompt Injection, Tool Poisoning, Replay, Tampered Binary, Offline Grace Expiry, Realm Isolation). |
| **GATE-06** | **Cryptographic Signature Integrity** | [`enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json`](../enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json) | Assinatura híbrida `Ed25519 + ML-DSA-65 (FIPS 204)` íntegra sobre todos os artefatos do pacote. |
| **GATE-07** | **Source Publication Boundary** | [`enterprise-compliance/source/source-manifest.json`](../enterprise-compliance/source/source-manifest.json) | Segregação estrita entre artefatos públicos de distribuição/auditoria e núcleo proprietário. |
| **GATE-08** | **Clean Rollback & Kill-Switch** | [`enterprise-compliance/compliance/homologation-gates.json`](../enterprise-compliance/compliance/homologation-gates.json) | Revogação remota via CRL funcional e desinstalação sem resíduos fora de `%USERPROFILE%`. |

---

## 4. Checklist Prático de Homologação em Sandbox (Passo a Passo para Analistas InfoSec)

### Passo 1 — Auditoria Estática e Criptográfica dos Artefatos
1. Clone este repositório em uma máquina de auditoria ou VM isolada.
2. Execute `audit\audit-infosec.cmd` no CMD ou `bash ./audit/verify-infosec-homologation.sh` no Git Bash.
3. Verifique que todos os **17 arquivos de evidência** em `enterprise-compliance/` possuem hash `SHA-256` idêntico ao registrado no manifesto assinado [`SQUADAI-TRANSPARENCY-MANIFEST.json`](../enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json).

### Passo 2 — Auditoria de Permissões e *Least Privilege* (Zero Admin / Zero PowerShell / Zero Driver)
1. Confirme que o pacote `SquadAI-Installer-Windows-v0_8_3.zip` executa integralmente com conta de **Usuário Padrão (Standard User)** via `Instalar-SquadAI.cmd` ou `./setup-squad-ai.sh`, sem usar `powershell.exe` e sem solicitar elevação UAC de Administrador.
2. Confirme que os arquivos são gravados exclusivamente sob `%USERPROFILE%\.squad-ai` e nos diretórios de configuração das IDEs do próprio usuário (`~/.claude`, `~/.gemini/config`, `~/.cursor`, `~/.copilot`).

### Passo 3 — Auditoria de Rede e *Zero Data Egress* (Wireshark / Proxy Corporativo)
1. Com captura de pacotes ativa (ou proxy de inspeção TLS), execute comandos locais do motor:
   ```cmd
   squad-harness.exe gate
   squad-harness.exe compute
   squad-harness.exe report
   ```
2. **Resultado esperado:** **Zero pacotes de rede externos (`0 bytes` de tráfego WAN)**. Toda a execução ocorre 100% offline na CPU/NPU local.
3. Na ativação de licença (`squad-harness license activate`), confirme que o payload JSON contém exclusivamente o hash `HMAC-SHA256` do e-mail, a chave pública do dispositivo e o *nonce* anti-replay (nenhum dado de repositório ou código-fonte).

### Passo 4 — Teste de Revogação (*Kill-Switch*) e Cópia Não Autorizada (*Anti-Clone*)
1. Copie a pasta `%USERPROFILE%\.squad-ai` de uma VM para outra VM diferente e execute o binário: o verificador bloqueará imediatamente com `ERR_HARDWARE_CLONE_OR_COPY_DETECTED`.
2. No Console Administrativo CloudFront, revogue a licença de teste na **CRL**: a estação perderá acesso imediatamente ao tentar renovar ou validar a sessão.

---

## 5. Emissão do Laudo de Homologação Interna

Ao executar `audit\audit-infosec.cmd` ou `bash ./audit/verify-infosec-homologation.sh`, o script emite o veredito técnico estruturado:
- Data/hora UTC da auditoria e identificação da estação do auditor;
- Hash `SHA-256` de todos os manifestos, SBOM, relatórios SAST/SCA e inventários MCP/Skills verificados;
- Status individual dos **8 Gates Corporativos** (`PASS` / `BLOCKED`);
- Veredito técnico final (`HOMOLOGATION_TECHNICAL_VERDICT: PASS (8/8 GATES)`) pronto para anexar ao ticket de Mudança (GMUD / ServiceNow / Jira Service Management) liberando a distribuição aos desenvolvedores.
