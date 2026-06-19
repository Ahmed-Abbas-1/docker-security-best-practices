# ==========================================
# Stage 1: The Builder
# ==========================================
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install --only=production

COPY . .

# ==========================================
# Stage 2: The Production
# ==========================================
FROM node:18-alpine

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=builder /app .

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD ["node", "server.js"]
