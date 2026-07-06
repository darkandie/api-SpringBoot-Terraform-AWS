package oliveira.carlos.deploy.controller;

import jdk.jfr.Timestamp;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@RestController
public class ApiResponse {

    @GetMapping
    public ResponseEntity<TimeStampResponse> response() {
        return ResponseEntity.ok(new TimeStampResponse(Instant.now()));
    }
}
