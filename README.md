# SquadAI Harness — Official Releases (v0.8.3)

<div align="center">
  <img src="assets/logo-squad-ai-harness.jpg" alt="SquadAI Harness — Official Releases" width="100%" />

  **Gated Autonomous Software Engineering · Agnóstico ao Domínio de Negócio · Runtime Nativo em Go 1.24.3 (`CGO_ENABLED=0`)**

  <!-- Core, Criptografia, Governança e Sistemas Operacionais -->
  [![Version](https://img.shields.io/badge/Version-v0.8.3-2563EB?style=flat-square)](manifests/releases/v0.8.3-release-manifest.json)
  [![Go Version](https://img.shields.io/badge/Go-1.24.3%20Exclusive-00ADD8?style=flat-square&logo=go&logoColor=white)](enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json)
  [![Dependencies](https://img.shields.io/badge/Dependencies-Zero%20External-success?style=flat-square)](enterprise-compliance/supply-chain/sbom.cdx.json)
  [![Canonical Skills](https://img.shields.io/badge/Skills-112%20Canonical%20(.sqenc)-0EA5E9?style=flat-square)](enterprise-compliance/ai-governance/skills-inventory.json)
  [![Continuous Eval](https://img.shields.io/badge/SkillEval-112%2F112%20PROVEN__SUCCESS-10B981?style=flat-square)](enterprise-compliance/compliance/homologation-gates.json)
  [![JEV Tribunal](https://img.shields.io/badge/JEV%20Specialists-25%20Deterministic-8B5CF6?style=flat-square)](enterprise-compliance/README-AUDIT.md)
  [![Assinatura](https://img.shields.io/badge/Signature-Ed25519%20%2B%20ML--DSA--65%20(FIPS%20204)-2979FF?style=flat-square)](docs/licensing.md)
  [![Envelopamento](https://img.shields.io/badge/Catalog%20Cipher-ML--KEM--768%20%2B%20AES--256--GCM-0284C7?style=flat-square)](docs/licensing.md)
  [![Enterprise Trust](https://img.shields.io/badge/Enterprise%20Trust-Zero--Trust%20%2B%20SLSA%20v1.0-0D9488?style=flat-square)](docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md)
  [![SBOM](https://img.shields.io/badge/SBOM-CycloneDX%201.5-AB47BC?style=flat-square)](manifests/releases/v0.8.3-sbom.cdx.json)
  [![Multi-OS Installer](https://img.shields.io/badge/OS-Windows%2010%2F11%20(CMD%2FGitBash)%20%7C%20Linux%20.deb%20%7C%20macOS-F59E0B?style=flat-square)](docs/installation.md)
  [![InfoSec Audit](https://img.shields.io/badge/InfoSec%20Audit-8%2F8%20Gates%20PASS-00E676?style=flat-square)](audit/audit-infosec.cmd)

  <br/>
  <strong>Tecnologias, Linguagens, Frameworks e Plataformas Implementadas nas Skills:</strong><br/>

  <!-- Linguagens, Runtimes & Frameworks Backend/Frontend -->
  ![Java 25 LTS](https://img.shields.io/badge/Java-21%20%7C%2025%20LTS%20%7C%2026%2F27-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
  ![Spring Boot 4](https://img.shields.io/badge/Spring%20Boot-4.x%20%2F%20Framework%207-6DB33F?style=flat-square&logo=springboot&logoColor=white)
  ![Quarkus AOT](https://img.shields.io/badge/Quarkus-3.39%20%2B%20GraalVM%20Native%20AOT-4695EB?style=flat-square&logo=quarkus&logoColor=white)
  ![Go Cloud Native](https://img.shields.io/badge/Go-1.24%E2%80%931.27%20Cloud%20Native-00ADD8?style=flat-square&logo=go&logoColor=white)
  ![Rust 1.99](https://img.shields.io/badge/Rust-1.99%20(Edition%202024)-000000?style=flat-square&logo=rust&logoColor=white)
  ![Python 3.14](https://img.shields.io/badge/Python-3.13%20%7C%203.14%20Free--Threaded-3776AB?style=flat-square&logo=python&logoColor=white)
  ![FastAPI](https://img.shields.io/badge/FastAPI-Async%20%2B%20uv-009688?style=flat-square&logo=fastapi&logoColor=white)
  ![.NET 10 C# 14](https://img.shields.io/badge/.NET%2010%20LTS-C%23%2014%20Native%20AOT-512BD4?style=flat-square&logo=dotnet&logoColor=white)
  ![Node.js 24/26](https://img.shields.io/badge/Node.js-24%20LTS%20%7C%2026%20(Fastify%2FExpress)-339933?style=flat-square&logo=nodedotjs&logoColor=white)
  ![TypeScript 7](https://img.shields.io/badge/TypeScript-7.0%20(tsgo%20Native)-3178C6?style=flat-square&logo=typescript&logoColor=white)
  ![Angular 22](https://img.shields.io/badge/Angular-21%2F22%20Signals%20%2B%20WCAG%202.2-DD0031?style=flat-square&logo=angular&logoColor=white)

  <!-- Cloud AWS, Serverless, IaC & Zero-Trust Network -->
  ![AWS Cloud](https://img.shields.io/badge/AWS-Lambda%20%7C%20ECS%20Fargate%20%7C%20Step%20Functions-FF9900?style=flat-square&logo=amazonwebservices&logoColor=white)
  ![AWS Event-Driven](https://img.shields.io/badge/AWS%20EDA-API%20Gateway%20%7C%20EventBridge%20%7C%20SQS%20%7C%20SNS-FF4F8B?style=flat-square&logo=amazonwebservices&logoColor=white)
  ![AWS Streaming & IoT](https://img.shields.io/badge/Streaming%20%26%20IoT-Kinesis%20%7C%20MSK%20Kafka%20%7C%20IoT%20Core-232F3E?style=flat-square&logo=apachekafka&logoColor=white)
  ![Terraform IaC](https://img.shields.io/badge/IaC-Terraform%20HCL%20%7C%20AWS%20SAM%20%7C%20CDK-844FBA?style=flat-square&logo=terraform&logoColor=white)
  ![HashiCorp Vault](https://img.shields.io/badge/Zero%20Trust-HashiCorp%20Vault%20%2B%20AWS%20VPC-000000?style=flat-square&logo=vault&logoColor=white)
  ![LocalStack](https://img.shields.io/badge/Local%20Cloud-LocalStack%20%2B%20Trace2Local-47A248?style=flat-square&logo=docker&logoColor=white)

  <!-- Bancos de Dados, Observabilidade, Qualidade & Segurança -->
  ![Databases](https://img.shields.io/badge/Databases-PostgreSQL%20%7C%20Aurora%20%7C%20DynamoDB%20%7C%20Redis-4169E1?style=flat-square&logo=postgresql&logoColor=white)
  ![DBML](https://img.shields.io/badge/Data%20Modeling-DBML%20%2B%20Single--Table%20%2B%20Outbox-003B57?style=flat-square&logo=databricks&logoColor=white)
  ![Datadog & OTel](https://img.shields.io/badge/Observability-Datadog%20APM%2FLogs%20%7C%20OpenTelemetry%20%7C%20CloudWatch-632CA6?style=flat-square&logo=datadog&logoColor=white)
  ![Security & SAST](https://img.shields.io/badge/AppSec-OWASP%20%7C%20Veracode%20%7C%20Checkov%20%7C%20Trivy-DC2626?style=flat-square&logo=owasp&logoColor=white)
  ![QA & Chaos](https://img.shields.io/badge/Testing-Testcontainers%20%7C%20Playwright%20%7C%20k6%20%7C%20AWS%20FIS%20Chaos-2EAD33?style=flat-square&logo=playwright&logoColor=white)

  <!-- IA, Aceleração de Hardware & Protocolo MCP Multi-IDE -->
  ![AI & Agents](https://img.shields.io/badge/Agentic%20AI-MCP%20%7C%20A2A%20%7C%20LangGraph%20%7C%20GraphRAG%20SEKG-7C3AED?style=flat-square&logo=anthropic&logoColor=white)
  ![LLM Providers](https://img.shields.io/badge/LLM%20%26%20Evals-Claude%20%7C%20Gemini%20%7C%20Bedrock%20%7C%20Agent%20Evals-D97706?style=flat-square&logo=googlecloud&logoColor=white)
  ![GPU & CV](https://img.shields.io/badge/Hardware%20%26%20CV-NVIDIA%20CUDA%20%7C%20Intel%20iGPU%20%7C%20NPU%20%7C%20OpenCV-76B900?style=flat-square&logo=nvidia&logoColor=white)
  ![12 Agentic IDEs](https://img.shields.io/badge/MCP%2012%20Tools-Claude%20%7C%20Antigravity%20%7C%20Cursor%20%7C%20Copilot%20%7C%20Codex%20%7C%20Windsurf-1E293B?style=flat-square)
</div>

![SquadAI Harness Hero Banner](assets/banners/squad-ai-hero-banner.svg)

---

## 1. Visão Executiva

O **SquadAI Harness** é uma plataforma corporativa de engenharia de software assistida por múltiplos especialistas coordenados, distribuída como **binário nativo assinado digitalmente** e integrada via **Model Context Protocol (MCP)** às principais ferramentas de desenvolvimento do mercado.

Este repositório (**SquadAI Harness — Official Releases** · `squad-ai-harness-releases`) é o **canal oficial público de distribuição, verificação de integridade, documentação operacional e conformidade corporativa**.

---

## 2. Problema que Resolve

Equipes de engenharia que adotam assistentes de IA enfrentam quatro desafios críticos em produção:
1. **Deriva arquitetural e ausência de governança** entre diferentes IDEs e ferramentas agênticas.
2. **Risco de segurança e vazamento de propriedade intelectual** ao executar scripts interpretados sem controle de integridade.
3. **Custo elevado de tokens e latência** em decisões repetitivas de revisão, conformidade e qualidade.
4. **Falta de rastreabilidade executiva** sobre horas economizadas, qualidade de entrega e conformidade regulatória.

---

## 3. Proposta de Valor

- **Execução Local Determinística (< 1 ms):** Motor nativo com verificação criptográfica de licença em memória (`< 1 µs`).
- **Integração Multi-Ferramenta via MCP (12 Ferramentas):** Opera simultaneamente com Claude Code, Google Antigravity, Cursor, GitHub Copilot, Codex CLI, Windsurf, Gemini CLI, Cline/Roo Code, Qwen Code, DeepSeek Harness, OpenCode e Resolve AI.
- **Proteção Integral de Propriedade Intelectual:** Catálogo de especialistas cifrado (`ML-KEM-768 + AES-256-GCM`) e liberado exclusivamente em memória mediante licença válida vinculada ao equipamento.

---

## 4. Arquitetura de Alto Nível

![Arquitetura Geral de Alto Nível](assets/diagrams/01-arquitetura-geral-alto-nivel.svg)

Consulte o detalhamento arquitetural em [docs/architecture.md](docs/architecture.md).

---

## 5. Diferenciais Técnicos

| Dimensão | Implementação Oficial SquadAI Harness |
|---|---|
| **Empacotamento** | Binário nativo único + Instalador corporativo Zero-EXE / Zero-PowerShell (CMD `.cmd`, Git Bash `.sh` e Wizard HTML auditáveis) |
| **Assinatura Digital** | Esquema híbrido `Ed25519 + ML-DSA-65 (FIPS 204)` + `SHA-256` |
| **Proteção de Catálogo** | `ML-KEM-768 (FIPS 203) + AES-256-GCM` com decriptação exclusiva em RAM |
| **Governança Corporativa** | `ENTERPRISE_COMPLIANCE_MODE` com bloqueio de rede *deny-by-default* e auditoria encadeada |

---

## 6. Como Funciona a Instalação Licenciada (13 Passos)

![Fluxo de Instalação e Validação de Licença](assets/diagrams/02-fluxo-instalacao-validacao-licenca.svg)

Nenhuma instalação operacional dos componentes proprietários se completa sem autorização criptográfica válida emitida pelo servidor de licenciamento:
1. Inicialização transacional do instalador.
2. Detecção de sistema operacional e arquitetura.
3. Geração da identidade criptográfica não exportável da instalação.
4. Coleta da credencial autorizada de ativação.
5. Conexão mútua via **TLS 1.3** ao servidor de licenciamento.
6. Validação da assinatura híbrida e do desafio criptográfico (*nonce*).
7. Verificação de validade e consulta à Lista de Revogação de Licenças (**CRL**).
8. Vinculação criptográfica da licença ao equipamento autorizado.
9. Autorização para liberação em memória do pacote cifrado (`.sqenc`).
10. Instalação do binário verificado e sincronização dos *stubs* declarativos.
11. Verificação final de integridade (`SHA-256`).
12. Execução do autoteste funcional pós-instalação.
13. Registro na trilha de auditoria local e remota.

---

## 7. Requisitos de Sistema

| Sistema Operacional | Arquiteturas Suportadas | Requisitos Mínimos |
|---|---|---|
| **Windows 10 / 11 / Server 2022+** | `amd64`, `arm64` | Windows CMD (`cmd.exe`) ou Git Bash (`bash`), Zero PowerShell, 4 GB RAM, 200 MB em disco |
| **macOS 14 (Sonoma) / 15 (Sequoia)+** | `arm64` (Apple Silicon), `amd64` | Keychain ativo, 4 GB RAM, 200 MB em disco |
| **Linux (Ubuntu 22.04+, Debian 12+, RHEL 9+)** | `amd64`, `arm64` | `glibc 2.35+` (ou estático musl), 4 GB RAM |

---

## 8. Guia Rápido de Instalação (Windows CMD / Git Bash, macOS e Linux)

### Windows (Instalador Corporativo Zero-EXE e Zero-PowerShell)
1. Baixe o pacote oficial na aba **Releases**: `SquadAI-Installer-Windows-v0_8_3.zip` e seu manifesto `SHA256SUMS.txt`.
2. Verifique a integridade `SHA-256` (Seção 13).
3. Extraia o arquivo `.zip` e escolha qualquer uma das opções nativas (sem depender de políticas `ExecutionPolicy` do PowerShell):
   - **Duplo-clique no CMD:** `Instalar-SquadAI.cmd` (abre o Wizard GUI HTML e o menu interativo no `cmd.exe`)
   - **Git Bash:** `./setup-squad-ai.sh` (ou `./setup-squad-ai.sh --silent --email dev@empresa.com`)
   - **Interface Gráfica Direta:** abra `SquadAI-Wizard-GUI.html` no navegador.

### macOS
1. Baixe `SquadAI-Installer-macOS-universal-v0_8_3.pkg` na aba **Releases**.
2. Verifique o hash `SHA-256` e execute o pacote assinado.

### Linux (Debian / Ubuntu)
1. Baixe `squad-ai-harness_0.8.3_amd64.deb` na aba **Releases**.
2. Verifique o hash `SHA-256` e instale via `sudo dpkg -i squad-ai-harness_0.8.3_amd64.deb`.

Guia detalhado em [docs/installation.md](docs/installation.md).

---

## 9. Como Ativar uma Licença

![Fluxo de Ativação e Vínculo com Equipamento](assets/diagrams/03-fluxo-ativacao-vinculo-equipamento.svg)

Durante a instalação ou no primeiro uso:

    squad-harness license activate --email seu.nome@empresa.com

O equipamento assina o desafio criptográfico com sua chave local selada no sistema operacional e recebe o certificado de licença assinado (`Ed25519 + ML-DSA-65`).

---

## 10. Como Recuperar ou Transferir uma Licença

![Fluxo de Recuperação e Troca de Computador](assets/diagrams/04-fluxo-recuperacao-troca-computador.svg)

Em caso de formatação do sistema operacional ou substituição de computador:

    squad-harness license recover --email seu.nome@empresa.com --otp <CODIGO-2FA>

A instalação anterior é automaticamente revogada na **CRL** e uma nova geração de licença (`LicenseGeneration + 1`) é emitida para o novo equipamento. Detalhes em [docs/licensing.md](docs/licensing.md).

---

## 11. Segurança, Criptografia e Proteção de Integridade

- **Assinatura Digital Híbrida:** `Ed25519` (RFC 8032) combinado com `ML-DSA-65` (NIST FIPS 204).
- **Envelopamento de Catálogo:** `ML-KEM-768` (NIST FIPS 203) combinado com `AES-256-GCM`.
- **Proteção Anti-Replay e Anti-Rollback:** Nonces de uso único e verificação de relógio monotônico.
- **Compatibilidade com EDR/Antivírus Corporativo:** Binários compilados sem *packers* invasivos (Zero-UPX), com símbolos enxutos (`-trimpath`) e scripts de instalação auditáveis.

---

## 12. Modelo de Confiança e Auditoria para Departamentos de Segurança (InfoSec / AppSec / GRC)

![Modelo de Confiança e Isolamento Corporativo](assets/diagrams/05-modelo-confianca-isolamento-corporativo.svg)

Para que o **Departamento de Segurança da Informação (InfoSec / AppSec / Red Team / GRC)** de empresas e bancos possa **homologar o SquadAI Harness em Sandbox antes de liberar a distribuição aos desenvolvedores**, este repositório público inclui um **Pacote Completo de Auditoria e Homologação Automatizada**:

### Execução Imediata da Auditoria pelo Time de Segurança (1 Comando — Zero PowerShell)

No **Windows CMD (`cmd.exe`)**:

    audit\audit-infosec.cmd

No **Git Bash (Windows) / Linux / macOS (`bash`)**:

    bash ./audit/verify-infosec-homologation.sh ./squad-harness

Ou diretamente via motor de inspeção embutido no binário oficial:

    squad-harness enterprise-trust --verify --json

### O que o Mecanismo de Auditoria Verifica Automaticamente (8 Gates Corporativos)
1. **GATE-01 (`SUPPLY_CHAIN_PROVENANCE`):** Valida SBOM CycloneDX 1.5 (`enterprise-compliance/supply-chain/sbom.cdx.json`), Proveniência SLSA v1.0 e checksums `SHA-256`.
2. **GATE-02 (`STATIC_AND_SECRET_ANALYSIS`):** Confere relatórios SAST (`0 CRITICAL/HIGH`), SCA (`0 CVEs críticos`) e varredura de segredos (`0 vazamentos`).
3. **GATE-03 (`AI_GOVERNANCE_AND_LEAST_AGENCY`):** Inspeciona o inventário completo das **8 tools MCP** (`enterprise-compliance/ai-governance/mcp-inventory.json` — todas `ReadOnly: true` e `Destructive: false`) e **104 skills** com *Least Agency*.
4. **GATE-04 (`NETWORK_ISOLATION_AND_ZERO_EGRESS`):** Audita a política *Deny-by-Default* (`enterprise-compliance/network/egress-allowlist.yaml`) garantindo zero envio de código-fonte, prompts ou diffs para fora do perímetro corporativo.
5. **GATE-05 (`ADVERSARIAL_RESILIENCE_A_TO_H`):** Verifica a bateria Red Team A–H (`enterprise-compliance/testing/adversarial-tests/scenarios-a-to-h.json`: Prompt Injection, Tool Poisoning, Replay, Tampered Binary, Offline Expiry, Realm Isolation).
6. **GATE-06 (`CRYPTOGRAPHIC_SIGNATURE_INTEGRITY`):** Valida o Manifesto de Transparência (`enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json`) assinado com esquema híbrido `Ed25519 + ML-DSA-65 (FIPS 204)`.
7. **GATE-07 (`SOURCE_PUBLICATION_BOUNDARY`):** Comprova a fronteira de propriedade intelectual e ausência de segredos ou chaves privadas nos artefatos distribuídos.
8. **GATE-08 (`CLEAN_ROLLBACK_AND_KILL_SWITCH`):** Valida o *Kill-Switch* remoto via CRL e a desinstalação limpa sem resíduos fora do perfil do usuário.

- **Roteiro Passo a Passo para Homologação Corporativa:** [docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md](docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md)
- **Guia de Conformidade Bancária e Corporativa:** [docs/enterprise-compliance.md](docs/enterprise-compliance.md)
- **Diretório de Evidências Auditáveis:** [enterprise-compliance/README-AUDIT.md](enterprise-compliance/README-AUDIT.md)

---

## 13. Verificação de Assinatura, Checksum e SBOM

![Ciclo de Release Assinado e Verificação de Integridade](assets/diagrams/06-ciclo-release-assinado-verificacao-integridade.svg)

Antes de instalar ou distribuir internamente qualquer pacote, valide sua integridade no **Windows CMD** ou **Git Bash**:

    :: No Windows CMD (cmd.exe)
    certutil -hashfile SquadAI-Installer-Windows-v0_8_3.zip SHA256
    type manifests\releases\SHA256SUMS.txt
    audit\audit-infosec.cmd

    # No Git Bash / Linux / macOS
    sha256sum SquadAI-Installer-Windows-v0_8_3.zip
    cat manifests/releases/SHA256SUMS.txt
    bash ./audit/verify-infosec-homologation.sh

- **Manifesto Assinado da Release:** [manifests/releases/v0.8.3-release-manifest.json](manifests/releases/v0.8.3-release-manifest.json)
- **Manifesto de Transparência Corporativa:** [enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json](enterprise-compliance/SQUADAI-TRANSPARENCY-MANIFEST.json)
- **SBOM CycloneDX 1.5:** [manifests/releases/v0.8.3-sbom.cdx.json](manifests/releases/v0.8.3-sbom.cdx.json)
- **Proveniência SLSA v1.0:** [manifests/releases/v0.8.3-provenance.slsa.json](manifests/releases/v0.8.3-provenance.slsa.json)
- **Scripts de Auditoria InfoSec (CMD e Git Bash):** [audit/audit-infosec.cmd](audit/audit-infosec.cmd) · [audit/verify-infosec-homologation.sh](audit/verify-infosec-homologation.sh)

---

## 14. Perguntas Frequentes (FAQ)

- **Posso copiar a pasta instalada para outro computador?**
  Não. A licença e a chave privada do dispositivo são seladas na âncora de segurança do sistema operacional original. Utilize `squad-harness license recover` para transferir oficialmente sua licença.
- **O instalador funciona sem privilégios de Administrador Local e sem PowerShell?**
  Sim. O pacote `SquadAI-Installer-Windows-v0_8_3.zip` instala no escopo do usuário (`%USERPROFILE%`) via **Windows CMD (`Instalar-SquadAI.cmd`)** ou **Git Bash (`setup-squad-ai.sh`)** e interface gráfica **HTML (`SquadAI-Wizard-GUI.html`)**, sem usar `powershell.exe` e sem exigir UAC elevado.
- **O que acontece se minha conexão cair após a ativação?**
  Após a ativação inicial, o verificador local opera em cache autenticado durante a janela de tolerância offline configurada no seu perfil de licença.

---

## 15. Suporte e Reporte Responsável de Vulnerabilidades

Para reportar vulnerabilidades de segurança de forma responsável, siga o protocolo descrito em [SECURITY.md](SECURITY.md). Para problemas operacionais, consulte [docs/troubleshooting.md](docs/troubleshooting.md).

---

## 16. Roadmap Público de Alto Nível

- **v0.8.3 (Atual):** Distribuição oficial assinada, instalador Zero-PowerShell (CMD + Git Bash + GUI HTML) condicionado à licença em 13 passos, catálogo cifrado `.sqenc` e pacote de conformidade bancária/enterprise.
- **Próximo Ciclo:** Suporte nativo a HSM PKCS#11 corporativo on-premises e federação OIDC/SAML 2.0 empresarial.

---

## 17. Documentação Completa

- [Visão Geral do Produto](docs/overview.md)
- [Arquitetura Pública e Componentes](docs/architecture.md)
- [Guia de Instalação Multiplataforma](docs/installation.md)
- [Ciclo de Vida de Licenciamento e Recuperação](docs/licensing.md)
- [Solução de Problemas (Troubleshooting)](docs/troubleshooting.md)
- [Conformidade Corporativa e Bancária](docs/enterprise-compliance.md)
- [Roteiro de Homologação para Departamentos de Segurança (InfoSec / AppSec / GRC)](docs/ROTEIRO_HOMOLOGACAO_SEGURANCA_CORPORATIVA.md)
- [Pacote de Evidências Auditáveis (8 Gates Corporativos)](enterprise-compliance/README-AUDIT.md)
- [Script Automatizado de Auditoria Windows CMD](audit/audit-infosec.cmd)
- [Script Automatizado de Auditoria Git Bash / Linux / macOS](audit/verify-infosec-homologation.sh)

---

## 18. Licença de Uso e Termos Comerciais

Distribuído sob licença comercial proprietária. Consulte os termos integrais em [LICENSE.md](LICENSE.md) e a política de privacidade em [PRIVACY.md](PRIVACY.md).
