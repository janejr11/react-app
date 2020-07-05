FROM ubuntu

EXPOSE 8100/tcp
COPY react-app /root/
COPY hello-world /root/hello-world
CMD /root/react-app -d /root/hello-world/build
