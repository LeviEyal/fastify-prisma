import { Prisma } from "@prisma/client";
import { FastifyRequest } from "fastify/types/request";

type GetVersionsRequest = FastifyRequest<{
	Params: {
		siteName: string;
	};
}>;

export async function getVersionsOfAllLanesBySite(request: GetVersionsRequest) {
	const { siteName } = request.params;
	const versions = await request.server.prisma.site.findFirst({
		where: {
			siteName,
		},
		include: {
			lanes: {
				select: {
					laneName: true,
					versions: {
						select: {
							package: true,
							version: true,
						},
					},
				},
			},
		},
	});
	return versions;
}

type AddVersionsRequest = FastifyRequest<{
	Params: {
		siteName: string;
	};
	Body: {
		laneName: string;
		versions: Prisma.VersionCreateManyInput[];
	};
}>;

/**
 * Add versions to a lane
 * @param request 
 * @returns 
 */
export async function addVersionsToLane(request: AddVersionsRequest) {
	const { laneName, versions } = request.body;
  const { siteName } = request.params;
  
  const lane = await request.server.prisma.lane.upsert({
    where: {
      siteName_laneName: {
        siteName,
        laneName,
      },
    },
    update: {
    },
    create: {
      laneName,
      screenshot_url: "",
      site: {
        connect: {
          siteName,
        },
      },
    },
  });


	versions.forEach(async (version) => {
		try {
			const res = await request.server.prisma.version.upsert({
				where: {
					siteName_laneName_package: {
						siteName,
						laneName,
						package: version.package,
					},
				},
				update: {
					version: version.version,
				},
				create: {
					package: version.package,
					version: version.version,
					lane: {
						connectOrCreate: {
							where: {
								siteName_laneName: {
									siteName,
									laneName,
								},
							},
							create: {
								laneName,
								screenshot_url: "",
								site: {
                  connect: {
                    siteName
                  }
								},
							},
						},
					},
				},
			});
			console.log(res);
		} catch (error) {
			return error;
		}
	});

	return { message: "Versions added successfully" };
}
