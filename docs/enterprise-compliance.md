# Conformidade Corporativa e Bancária (Enterprise Compliance)

## Controles Garantidos no Modo Corporativo (`ENTERPRISE_COMPLIANCE_MODE`)
- **Isolamento de Rede (*Deny-by-Default*):** Nenhuma conexão com endpoints pessoais ou não homologados.
- **Zero Egress de Código ou Prompts:** Toda avaliação sintática e de conformidade ocorre localmente no binário auditado.
- **Auditoria Criptográfica:** Eventos operacionais registrados localmente em cadeia `SHA-256` verificável pelo time de Segurança/SIEM.
- **Desinstalação e Rollback Limpos:** Remoção integral de artefatos sem resíduos ocultos no registro ou fora do diretório de usuário.
