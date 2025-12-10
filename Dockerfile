FROM golang@sha256:f123f64ef1f320e60a1d238d7b04f2f8b8ad5566cb35ecca5dc563447ebb300e

COPY go.mod .
COPY main.go .

CMD ["go", "run", "main.go"]
