FROM alpine
WORKDIR /app
RUN apk --no-cache add postgresql16-client
COPY clean1.sql .
COPY run.sh .
CMD ["sh", "run.sh"]
