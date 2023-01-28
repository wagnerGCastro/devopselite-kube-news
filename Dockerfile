FROM node:14.15.4-alpine3.12 as common-build-stage

RUN apk add --no-cache bash
WORKDIR /app

COPY  package*.json ./
RUN npm install
COPY . .

ENV HOST 0.0.0.0
EXPOSE 3079

# Production build stage
FROM common-build-stage as production-build-stage
ENV NODE_ENV production
CMD ["npm", "run", "start"]
