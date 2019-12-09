PIDS=$(ps ax | grep -i 'kafka\.Kafka' | grep java | grep -v grep | awk '{print $1}')

if [ -z "$PIDS" ]; then
  echo "No kafka server is running"
  exit -8
else
  echo "Kafka server is running with PID " $PIDS >> /opt/kafka/kafka-liveness-chk.out
  exit 0
fi
