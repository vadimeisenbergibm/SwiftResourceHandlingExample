// swift-tools-version:4.0

/**
 * Copyright Vadim Eisenberg 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import PackageDescription

let package = Package(
    name: "SwiftResourceHandlingExample",
    products: [
        .library(
            name: "ResourceHandling",
            targets: ["ResourceHandling"]),
        .executable(
            name: "ResourceHandlingSample",
            targets: ["ResourceHandlingSample"]),
    ],
    targets: [
        .target(
            name: "ResourceHandling",
            dependencies: []),
        .target(
            name: "ResourceHandlingSample",
            dependencies: ["ResourceHandling"]),
        .testTarget(
            name: "ResourceHandlingTests",
            dependencies: ["ResourceHandling"]),
    ]
)
