# NPM packages license checker Cloud Build custom builder

This repo contains how to create a custom builder for Cloud Build to check NPM packages licenses.

## How to use

Build the custom builder:

```bash
gcloud buils submit
```

Then, move to the test directory and test how it works:

```bash
cd test && gcloud builds submit
```

## Further automation

Add this repo to Cloud Source Repositories:

```bash
PROJECT_ID=$(gcloud config get-value project)
gcloud source repos create npm-license-checker --project $PROJECT_ID
git remote add google \
  https://source.developers.google.com/p/$PROJECT_ID/r/npm-license-checker-cb-step
git push --all google
```

Create a Cloud Build trigger to run the custom builder on every commit to this repo:
```bash
gcloud beta builds triggers create cloud-source-repositories \
  --repo npm-license-checker-cb-step \
  --branch-pattern master \
  --build-config cloudbuild.yaml
```

