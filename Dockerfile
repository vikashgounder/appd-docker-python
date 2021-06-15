FROM python:3.6
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8080
RUN pip install appdynamics
ADD /monitoring /monitoring
 
ENTRYPOINT ["pyagent", "run", "-c", "monitoring/appdynamics.config", "--", "python", "app/app.py"]
