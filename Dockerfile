FROM google/cloud-sdk:391.0.0-alpine as builder

RUN gcloud -q components update
RUN gcloud -q components install bigtable


FROM alpine

COPY --from=builder /google-cloud-sdk/platform/bigtable-emulator/cbtemulator /cbtemulator

ENTRYPOINT ["/cbtemulator"]
CMD ["--host=0.0.0.0", "--port=8086"]

