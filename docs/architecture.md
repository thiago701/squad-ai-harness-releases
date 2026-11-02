# Arquitetura de Integração

## Como Funciona na Estação do Desenvolvedor
1. **Arquivos de Integração nas IDEs:** O instalador registra as definições de especialistas nas pastas de configuração das IDEs instaladas na máquina.
2. **Motor Local (`squad-harness`):** Executa localmente as ferramentas de apoio, validações de qualidade e relatórios de uso.
3. **Servidor MCP Local:** Comunica-se com a IDE via entrada/saída padrão (`stdio`) sem expor portas externas na internet.
