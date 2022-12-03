import { FastifyRequest } from "fastify/types/request";

export async function getAllSites(request: FastifyRequest) {
  const sites = await request.server.prisma.site.findMany();
  return sites;
}