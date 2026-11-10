# Changelog Oficial

## [v1.0.114] - 2026-11-02 — SquadAI Harness v1.0.114
### Adicionado
- **Instaladores Autossuficientes de Arquivo Único por SO (`setup-squad-ai-windows.sh`, `setup-squad-ai-linux.sh`, `setup-squad-ai-macos.sh`):** `4,04 MB` com todas as **113 skills completas** embutidas (sem necessidade de arquivo `.zip` nem de clonar o repositório), com confirmação visual de `[SUCESSO]` ou `[FALHA]` ao final da execução.
- **Provisionamento Padrão no `$HOME` e Desinstalação Seletiva Protetora:** cria por padrão no `$HOME` as pastas de skills para **Claude**, **Codex**, **Gemini** e **Copilot** (instalando nas demais ferramentas apenas se já existirem no disco) e remove exclusivamente as skills da SquadAI ao desinstalar, preservando as skills do desenvolvedor.
- **Engenharia de Dashboards Inteligentes (`intelligent-dashboard-engineer`):** nova capacidade de engenharia de dashboards executivos e científicos Zero-JS (Go SSR + SVG vetorial), neuroergonomia, percepção cromática WCAG 2.2/APCA e detecção estatística de anomalias.
- **Auditoria de Homologação Integrada (`bash ./setup-squad-ai-windows.sh --audit`):** verificação automatizada em 8 Gates com ensaio em Sandbox isolado e geração do laudo `homologation-audit-report.json` para equipes de Segurança da Informação.
