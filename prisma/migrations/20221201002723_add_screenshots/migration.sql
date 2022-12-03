-- CreateTable
CREATE TABLE `monitor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `screenshot_url` VARCHAR(191) NOT NULL,
    `last_updated` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
