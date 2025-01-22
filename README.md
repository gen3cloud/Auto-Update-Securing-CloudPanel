# 🚀 Atualização Automática do CloudPanel

A capacidade de atualizar automaticamente o **CloudPanel** se tornou essencial diante das crescentes preocupações de segurança. Recentes ataques exploraram vulnerabilidades zero-day em versões anteriores à **V2.3.1**, comprometendo servidores e formando botnets maliciosas. Apesar de um patch crítico lançado, muitos usuários negligenciaram a atualização, resultando em diversas vítimas de ataques.

Este repositório oferece um **script shell** e instruções detalhadas para automatizar o processo de atualização do **CloudPanel**, garantindo que seu servidor permaneça seguro e atualizado.

---

## 🛡️ **Entendendo as Vulnerabilidades e Riscos**

### ⚠️ Vulnerabilidades (versões anteriores à V2.3.1):
- **Escalada de Privilégios por Path Traversal:** Manipulação de caminhos de arquivos, permitindo acesso e modificação não autorizada.
- **Escalada de Privilégios por Injeção de Comandos:** Execução de comandos maliciosos através do `clpctlWrapper`.

### 🔴 Riscos:
- Ataques DDoS
- Acesso não autorizado a dados sensíveis
- Vazamento de dados
- Comprometimento do servidor

---

## 📜 **Script de Atualização**

Este script automatiza o processo de atualização diária do CloudPanel. 

### Como usar o script:

1. Crie um arquivo chamado `update.sh` e cole o seguinte código:

    ```bash
    #!/bin/bash
    LOG_FILE="/var/log/clp-update.log"

    echo "Iniciando clp-update em $(date)" >> "$LOG_FILE"
    sudo clp-update >> "$LOG_FILE" 2>&1
    echo "clp-update concluído em $(date)" >> "$LOG_FILE"
    ```

2. Torne o script executável com o comando:

    ```bash
    chmod +x update.sh
    ```

3. (Opcional) Salve o script em um local seguro, como `/root/update.sh`.

---

## 🔄 **Configuração do Cron Job**

Siga os passos abaixo para agendar a execução automática do script diariamente às **3:00 AM**:

1. Abra o crontab para edição:
    ```bash
    crontab -e
    ```

2. Adicione a seguinte linha ao arquivo do crontab:
    ```bash
    0 3 * * * /bin/bash /caminho/para/seu/update.sh
    ```

3. Salve e saia para ativar o cron job.

> 🔧 **Nota:** Substitua `/caminho/para/seu/update.sh` pelo caminho real onde o script está localizado.

---

## 🔐 **Melhores Práticas de Segurança**

Para proteger ainda mais o seu servidor **CloudPanel**, siga estas recomendações:

1. **Use Firewalls e Limite o Acesso:** 
    - Configure firewalls como o **CrowdSec**.
    - Utilize whitelists de IP para limitar acessos.
  
2. **Implemente Autenticação Segura:**
    - Exija senhas fortes para todos os usuários.
    - Habilite a autenticação de dois fatores (2FA).

3. **Realize Backups Regulares:**
    - Utilize ferramentas de backup disponíveis no CloudPanel.
    - Mantenha cópias de segurança em locais externos e seguros.

4. **Verifique o Sistema Após Atualizações:**
    - Revise os logs de atualização.
    - Realize testes para confirmar que o sistema está operando corretamente.

---

## 📂 **Licença**

Este projeto está licenciado sob a [MIT License](LICENSE). Sinta-se à vontade para contribuir com melhorias e sugestões!

---

## ⚠️ **Aviso Importante**

Este script e as instruções foram testados com base nas informações mais recentes até **janeiro de 2025**. Antes de utilizá-lo em produção, teste-o em um ambiente de desenvolvimento ou staging. 
