# Arquitetura Pública de Alto Nível

## Camadas Operacionais
1. **Interface de Descoberta (Stubs Declarativos):** Arquivos leves sincronizados nas ferramentas agênticas que expõem apenas o contrato de invocação MCP.
2. **Motor Nativo Local (`squad-harness`):** Processa validações, relatórios executivos e chamadas MCP localmente.
3. **Verificador de Licença e Catálogo em Memória:** Valida a assinatura híbrida da licença (`< 1 µs` em cache quente) antes de abrir o catálogo cifrado (`.sqenc`) em RAM.
