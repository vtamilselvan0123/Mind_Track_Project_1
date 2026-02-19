FROM node:18-alpine
WORKDIR /app
RUN npm install -g serve
COPY dist /app/dist
EXPOSE 3000
CMD ["serve", "dist", "-l", "3000"]
