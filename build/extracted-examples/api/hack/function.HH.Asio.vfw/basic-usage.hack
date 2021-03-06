// WARNING: Contains some auto-generated boilerplate code, see:
// HHVM\UserDocumentation\MarkdownExt\ExtractedCodeBlocks\FilterBase::addBoilerplate

namespace HHVM\UserDocumentation\Api\Hack\FunctionHHAsioVfw\BasicUsage;

<<__EntryPoint>>
async function basic_usage_main(): Awaitable<void> {
  \init_docs_autoloader();

  // Return all non-negative odd numbers
  // Positive evens filtered out,
  // Negatives and zero cause exception
  $odds = await \HH\Asio\vfw(
    Vector {-1, 0, 1, 2, 3, 4},

    async ($val) ==> {
      if ($val <= 0) {
        throw new \Exception("$val is non-positive");
      } else {
        return ($val % 2) == 1;
      }
    },
  );

  foreach ($odds as $result) {
    if ($result->isSucceeded()) {
      echo "Success: ";
      \var_dump($result->getResult());
    } else {
      echo "Failed: ";
      \var_dump($result->getException()->getMessage());
    }
  }
}
