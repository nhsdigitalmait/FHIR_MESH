FROM nhsdigitalmait/tkw-x:c7a8506

ARG USER_ID

RUN useradd -rm -u $USER_ID service
RUN mkdir /home/service/data/ && chown service:service /home/service/data/
RUN mkdir /home/service/MESH/ && chown service:service /home/service/MESH/
VOLUME /home/service/data
VOLUME /home/service/fhir
VOLUME /home/service/MESH
COPY . /home/service/TKW/config/FHIR_MESH
WORKDIR /home/service/TKW/config/FHIR_MESH
#RUN mkdir /home/service/TKW/config/FHIR_MESH/simulator_saved_messages/
#RUN mkdir /home/service/TKW/config/FHIR_MESH/messages_for_validation/
RUN sh set-all-configurations.sh
RUN chown service:service /home/service/TKW/config/FHIR_MESH/intermediary_temp/

USER service
ENTRYPOINT ["bash", "runtkwentrypoint.sh"]

