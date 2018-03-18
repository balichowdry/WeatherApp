//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import Foundation

func isEmptyString(_ string: String?) -> Bool {
  guard let string = string else {
    return true
  }
  
  return string.isEmpty
}

func encodedUrl(_ url: URL?) -> URL {
  let urlString: String = url!.absoluteString.removingPercentEncoding!
  let urlEncoded = URL(string: urlString)
  
  return urlEncoded!
}
