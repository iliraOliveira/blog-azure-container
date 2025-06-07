# Use a imagem oficial do Nginx
FROM nginx:latest

# Copie arquivos de configuração personalizados, se necessário
# COPY nginx.conf /etc/nginx/nginx.conf

# Copie arquivos do site para o diretório padrão do Nginx, se necessário
COPY Blog/html /usr/share/nginx/html

# Exponha a porta padrão do Nginx
EXPOSE 80