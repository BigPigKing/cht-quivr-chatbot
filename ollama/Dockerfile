# Using a slim version for a smaller base image
FROM ollama/ollama

WORKDIR /
COPY ./codes/install_models.sh /install_models.sh
RUN chmod +x /install_models.sh

EXPOSE 11434

ENTRYPOINT [ "./install_models.sh" ]