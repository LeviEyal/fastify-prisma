/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Profile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Post` DROP FOREIGN KEY `Post_ibfk_1`;

-- DropForeignKey
ALTER TABLE `Profile` DROP FOREIGN KEY `Profile_ibfk_1`;

-- DropTable
DROP TABLE `Post`;

-- DropTable
DROP TABLE `Profile`;

-- DropTable
DROP TABLE `User`;

-- CreateTable
CREATE TABLE `Site` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Lane` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `siteId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Version` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `laneId` INTEGER NOT NULL,
    `packages` VARCHAR(191) NOT NULL,
    `versions` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Lane` ADD FOREIGN KEY (`siteId`) REFERENCES `Site`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Version` ADD FOREIGN KEY (`laneId`) REFERENCES `Lane`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
