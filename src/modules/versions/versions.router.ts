import { FastifyInstance } from "fastify";
import { addVersionsToLane, getVersionsOfAllLanesBySite } from "./versions.controller";

export const versionsRouter = async (server: FastifyInstance) => {
  server.route({
    method: "GET",
    url: "/:siteName",
    schema: {
      params: {
        type: "object",
        properties: {
          siteName: { type: "string" },
        },
      },
    },
    handler: getVersionsOfAllLanesBySite,
  })

  server.route({
    method: "POST",
    url: "/:siteName",
    schema: {
      params: {
        type: "object",
        properties: {
          siteName: { type: "string" },
        },
      },
      body: {
        type: "object",
        properties: {
          laneName: { type: "string" },
          versions: {
            type: "array",
            items: {
              type: "object",
              properties: {
                package: { type: "string" },
                version: { type: "string" },
              },
            },
          },
        },
      },
    },
    handler: addVersionsToLane,
  })
};
