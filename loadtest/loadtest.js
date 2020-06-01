
import { sleep } from "k6";
import http from "k6/http";

export let options = {
  duration: "30s",
  vus: 50
};

export default function() {
  http.get("http://app.cloudops.infra.lab");
  sleep(1);
}
