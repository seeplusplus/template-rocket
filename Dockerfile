FROM rust:slim-bullseye AS build
WORKDIR /build/
COPY . .
RUN cargo build --release

FROM debian:bullseye-slim as run
COPY --from=build /build/target/release/{{crate_name}} .
COPY --from=build /build/Rocket.toml .
CMD ["./{{crate_name}}"]
