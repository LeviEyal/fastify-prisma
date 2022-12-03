/*
  Warnings:

  - You are about to drop the `monitor` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `monitorId` to the `Lane` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Lane` ADD COLUMN `monitorId` INTEGER;

-- DropTable
DROP TABLE `monitor`;

-- CreateTable
CREATE TABLE `Monitor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `screenshot_url` VARCHAR(191) NOT NULL,
    `last_updated` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Lane` ADD CONSTRAINT `Lane_monitorId_fkey` FOREIGN KEY (`monitorId`) REFERENCES `Monitor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
