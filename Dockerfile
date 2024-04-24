# SPDX-FileCopyrightText: 2024 Markus Ijäs
#
# SPDX-License-Identifier: CC0-1.0

FROM golang:1-bookworm AS prebuild

    EXPOSE 8000

    WORKDIR /app

    RUN useradd -ms /bin/bash tasktool
    RUN mkdir /app/static

	COPY ./app .

    RUN chown -R tasktool:tasktool /tasktool

    COPY ./entrypoint.sh ./entrypoint.sh
    RUN chmod +x ./entrypoint.sh

    USER tasktool

    CMD ["/app/entrypoint.sh"]