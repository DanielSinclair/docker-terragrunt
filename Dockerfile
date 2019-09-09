FROM alpine:latest
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.19.23/terragrunt_linux_amd64 terragrunt
RUN chmod +x terragrunt
FROM hashicorp/terraform:0.12.7
COPY --from=0 terragrunt /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/terragrunt"]