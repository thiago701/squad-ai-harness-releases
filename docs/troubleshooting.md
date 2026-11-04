# Solução de Problemas (Troubleshooting)

| Código | Causa | Como Resolver |
|---|---|---|
| `SERVER_UNAVAILABLE` | Sem acesso HTTPS ao servidor de ativação no primeiro uso | Verifique sua conexão de rede ou proxy e tente novamente |
| `ERR_OFFLINE_GRACE_EXPIRED` | Período de uso offline expirou | Conecte-se à internet e execute `squad-harness license refresh` |
| `ERR_HARDWARE_CLONE_OR_COPY_DETECTED` | Pasta copiada diretamente de outro computador | Execute `squad-harness license recover` para ativar corretamente na nova máquina |
| `ERR_CLOCK_ROLLBACK_DETECTED` | Relógio do sistema operacional está incorreto | Sincronize a data e hora do sistema operacional |
