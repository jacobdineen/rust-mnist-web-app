# Getting Started
This project modifies some of the examples in the [burn](https://github.com/tracel-ai/burn) project to demonstrate how to use Burn to train and inference models.
Namely, it bundles two of the examples in the burn project into a single web app.


## Example Usage

### Train the Model (locally)
```bash
cargo run --example train --release --features wgpu
```

### Web App
```bash
./build-for-web.sh ndarray && ./run_server.sh --serve
```