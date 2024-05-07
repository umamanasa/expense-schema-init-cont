FROM        dokken/centos-8
RUN         yum install unzip git jq -y
RUN         curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm -rf aws*
COPY        mysql.repo /etc/yum.repos.d/mysql.repo
RUN         yum install mysql-community-server -y
COPY        run.sh /
ENTRYPOINT  [ "bash", "/run.sh" ]
