FROM python:3.13.9-slim-trixie
WORKDIR /workspace
COPY --from=ghcr.io/astral-sh/uv:0.7.15 /uv /uvx /bin/
COPY pyproject.toml /workspace/
ENV UV_LINK_MODE=copy
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync
CMD ["uv", "run", "mkdocs", "serve", "--dev-addr", "0.0.0.0:8000"]
