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

import Foundation

public enum ReaderError: Error {
    case resourceNotFound
    case readFailed(Error)
    case convertToStringFailed
}

public class Reader {
    public init() {}

    public func read(resource: String, ofType type: String) throws -> String {
        let bundle = Bundle(for: Swift.type(of: self))
        // uncomment the following lines to print the directory
        // the resource files are expected to be located
        //print(bundle.resourcePath ?? "no resource path provided")

        guard let resourcePath = bundle.path(forResource: resource, ofType: type) else {
            throw ReaderError.resourceNotFound
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: resourcePath))
            guard let string = String(data: data, encoding: String.Encoding.utf8) else {
                throw ReaderError.convertToStringFailed
            }

            return string
        } catch {
            throw ReaderError.readFailed(error)
        }
    }
}
