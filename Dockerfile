FROM nhsdigitalmait/tkw-x:a3450be

ARG USER_ID

RUN useradd -rm -u $USER_ID service
RUN mkdir /home/service/data/ && chown service:service /home/service/data/
RUN mkdir /home/service/MESH/ && chown service:service /home/service/MESH/
COPY . /home/service/TKW/config/FHIR_MESH
WORKDIR /home/service/TKW/config/FHIR_MESH
RUN mkdir /home/service/TKW/config/FHIR_MESH/simulator_saved_messages/
RUN mkdir /home/service/TKW/config/FHIR_MESH/messages_for_validation/
RUN sh set-all-configurations.sh

ENV TKWROOT=/home/service/TKW
ENV FHIR_ASSETS_NPMTAR_ROOT=/home/service/fhir
ENV FHIR_ASSETS_ROOT=/home/service/fhir
ENV EXT_CONFIG_ROOT=/home/service/external_config

USER service
ENTRYPOINT ["bash", "runtkwentrypoint.sh"]

