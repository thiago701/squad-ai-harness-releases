# Solução de Problemas (Troubleshooting)

| Código de Erro | Causa | Ação Recomendada |
|---|---|---|
| `SERVER_UNAVAILABLE` | Sem acesso HTTPS ao servidor de licenciamento na instalação inicial | Verifique sua conexão ou proxy corporativo e execute o instalador novamente |
| `ERR_OFFLINE_GRACE_EXPIRED` | Janela de tolerância offline expirou | Conecte-se à rede e execute `squad-harness license refresh` |
| `ERR_HARDWARE_CLONE_OR_COPY_DETECTED` | Diretório copiado de outro computador | Execute `squad-harness license recover` para transferir a licença oficialmente |
| `ERR_CLOCK_ROLLBACK_DETECTED` | Relógio do sistema operacional foi retrocedido | Sincronize o horário do sistema via NTP |
